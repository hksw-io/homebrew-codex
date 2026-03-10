#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import time
import urllib.request
import urllib.error
from dataclasses import dataclass
from pathlib import Path
from typing import Any


REPO_ROOT = Path(__file__).resolve().parents[1]
UPSTREAM_REPO = os.environ.get("UPSTREAM_REPO", "openai/codex")
TAP_REPO = os.environ.get("TAP_REPO", "hksw-io/homebrew-codex")
GIT_BRANCH = os.environ.get("GIT_BRANCH", "master")
GH_TOKEN = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN")
GIT_USER_NAME = os.environ.get("GIT_USER_NAME")
GIT_USER_EMAIL = os.environ.get("GIT_USER_EMAIL")
API_BASE = "https://api.github.com"

REQUIRED_ASSETS = {
    "arm": "codex-aarch64-apple-darwin.tar.gz",
    "intel": "codex-x86_64-apple-darwin.tar.gz",
    "arm64_linux": "codex-aarch64-unknown-linux-musl.tar.gz",
    "x86_64_linux": "codex-x86_64-unknown-linux-musl.tar.gz",
}
VERSION_RE = re.compile(r"^(?P<major>\d+)\.(?P<minor>\d+)\.(?P<patch>\d+)(?:-alpha\.(?P<alpha>\d+))?$")
CASK_VERSION_RE = re.compile(r'^\s*version "([^"]+)"', re.MULTILINE)


@dataclass(frozen=True)
class ReleaseInfo:
    tag_name: str
    version: str
    prerelease: bool
    published_at: str
    html_url: str
    sha256: dict[str, str]

    @property
    def release_type(self) -> str:
        return "prerelease" if self.prerelease else "stable"

    @property
    def cask_token(self) -> str:
        return "codex"

    @property
    def cask_path(self) -> Path:
        return REPO_ROOT / "Casks" / "codex.rb"

    @property
    def version_key(self) -> tuple[int, int, int, int, int]:
        return version_key(self.version)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Mirror upstream Codex releases into this tap.")
    parser.add_argument("--dry-run", action="store_true", help="Do not write files, commit, push, or create releases.")
    parser.add_argument("--verbose", action="store_true", help="Print extra progress information.")
    return parser.parse_args()


def git(
    *args: str,
    capture_output: bool = True,
    check: bool = True,
    env: dict[str, str] | None = None,
) -> subprocess.CompletedProcess[str]:
    process_env = os.environ.copy()
    if env:
        process_env.update(env)
    return subprocess.run(
        ["git", *args],
        cwd=REPO_ROOT,
        check=check,
        text=True,
        capture_output=capture_output,
        env=process_env,
    )


def log(message: str) -> None:
    print(message, flush=True)


def debug(enabled: bool, message: str) -> None:
    if enabled:
        log(message)


def api_request(path: str, token: str | None, method: str = "GET", data: dict[str, Any] | None = None) -> Any:
    headers = {
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
        "User-Agent": "hksw-io-homebrew-codex-updater",
    }
    if token:
        headers["Authorization"] = f"Bearer {token}"

    body = None
    if data is not None:
        body = json.dumps(data).encode("utf-8")
        headers["Content-Type"] = "application/json"

    last_error: Exception | None = None
    for attempt in range(5):
        request = urllib.request.Request(f"{API_BASE}{path}", headers=headers, method=method, data=body)
        try:
            with urllib.request.urlopen(request) as response:
                payload = response.read()
        except urllib.error.HTTPError as exc:
            if exc.code == 422 and path.startswith(f"/repos/{TAP_REPO}/releases"):
                return {"already_exists": True}

            if exc.code in (403, 429):
                retry_after = exc.headers.get("Retry-After")
                reset = exc.headers.get("X-RateLimit-Reset")
                delay = 60
                if retry_after:
                    delay = max(1, int(retry_after))
                elif reset:
                    delay = max(1, int(reset) - int(time.time()))
                elif attempt:
                    delay = 60 * (attempt + 1)
                time.sleep(delay)
                last_error = exc
                continue

            details = exc.read().decode("utf-8", errors="replace")
            raise RuntimeError(f"GitHub API request failed: {exc.code} {path}: {details}") from exc
        else:
            if not payload:
                return None
            return json.loads(payload.decode("utf-8"))

    raise RuntimeError(f"GitHub API request kept failing for {path}") from last_error


def fetch_release_page(page: int, token: str | None) -> list[ReleaseInfo]:
    payload = api_request(f"/repos/{UPSTREAM_REPO}/releases?per_page=100&page={page}", token)
    assert isinstance(payload, list)
    releases: list[ReleaseInfo] = []
    for item in payload:
        tag_name = str(item.get("tag_name", ""))
        if not tag_name.startswith("rust-v"):
            continue
        releases.append(release_from_api(item))
    return releases


def release_from_api(item: dict[str, Any]) -> ReleaseInfo:
    tag_name = str(item["tag_name"])
    if not tag_name.startswith("rust-v"):
        raise ValueError(f"Unexpected upstream tag format: {tag_name}")

    asset_digests: dict[str, str] = {}
    for key, asset_name in REQUIRED_ASSETS.items():
        asset = next((candidate for candidate in item["assets"] if candidate["name"] == asset_name), None)
        if asset is None:
            raise ValueError(f"Release {tag_name} is missing required asset {asset_name}")
        digest = str(asset.get("digest", ""))
        if not digest.startswith("sha256:"):
            raise ValueError(f"Release {tag_name} has no sha256 digest for {asset_name}")
        asset_digests[key] = digest.removeprefix("sha256:")

    return ReleaseInfo(
        tag_name=tag_name,
        version=tag_name.removeprefix("rust-v"),
        prerelease=bool(item["prerelease"]),
        published_at=str(item["published_at"]),
        html_url=str(item["html_url"]),
        sha256=asset_digests,
    )


def version_key(version: str) -> tuple[int, int, int, int, int]:
    match = VERSION_RE.fullmatch(version)
    if match is None:
        raise ValueError(f"Unsupported Codex release version: {version}")

    major = int(match.group("major"))
    minor = int(match.group("minor"))
    patch = int(match.group("patch"))
    alpha = match.group("alpha")

    if alpha is None:
        return (major, minor, patch, 1, 0)

    return (major, minor, patch, 0, int(alpha))


def release_outranks_active(release: ReleaseInfo, active_version: str | None) -> bool:
    if active_version is None:
        return True
    return release.version_key > version_key(active_version)


def read_active_cask_version() -> str | None:
    path = REPO_ROOT / "Casks" / "codex.rb"
    if not path.exists():
        return None

    content = path.read_text(encoding="utf-8")
    match = CASK_VERSION_RE.search(content)
    if match is None:
        raise RuntimeError("Could not determine the active codex cask version.")

    version = match.group(1)
    version_key(version)
    return version


def select_releases_for_sync(existing_tags: set[str], token: str | None) -> list[ReleaseInfo]:
    if not existing_tags:
        latest_release: ReleaseInfo | None = None
        page = 1
        while True:
            batch = fetch_release_page(page, token)
            if not batch:
                break
            for release in batch:
                if latest_release is None or release.version_key > latest_release.version_key:
                    latest_release = release
            page += 1

        return [latest_release] if latest_release is not None else []

    pending: list[ReleaseInfo] = []
    page = 1
    while True:
        batch = fetch_release_page(page, token)
        if not batch:
            break
        unseen_on_page = 0
        for release in batch:
            if release.tag_name not in existing_tags:
                pending.append(release)
                unseen_on_page += 1
        if unseen_on_page == 0:
            break
        page += 1

    pending.sort(key=lambda release: release.published_at)
    return pending


def render_cask(release: ReleaseInfo) -> str:
    return f"""cask "{release.cask_token}" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "{release.version}"
  sha256 arm:          "{release.sha256["arm"]}",
         intel:        "{release.sha256["intel"]}",
         arm64_linux:  "{release.sha256["arm64_linux"]}",
         x86_64_linux: "{release.sha256["x86_64_linux"]}"

  url "https://github.com/openai/codex/releases/download/rust-v#{{version}}/codex-#{{arch}}-#{{os}}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\\d+(?:\\.\\d+)+(?:-alpha\\.\\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{{arch}}-#{{os}}", target: "codex"

  zap rmdir: "~/.codex"
end
"""


def ensure_clean_worktree() -> None:
    status = git("status", "--porcelain", "--untracked-files=no").stdout.strip()
    if status:
        raise RuntimeError("Refusing to run with a dirty working tree.")


def git_config_value(key: str) -> str | None:
    result = git("config", "--get", key, check=False)
    if result.returncode != 0:
        return None
    value = result.stdout.strip()
    return value or None


def resolve_git_identity() -> tuple[str, str]:
    name = GIT_USER_NAME or git_config_value("user.name")
    email = GIT_USER_EMAIL or git_config_value("user.email")
    if name is None or email is None:
        raise RuntimeError(
            "Git commit identity is not configured. Set GIT_USER_NAME and GIT_USER_EMAIL or configure git user.name and user.email."
        )
    return name, email


def configure_repo(verbose: bool) -> None:
    git_user_name, git_user_email = resolve_git_identity()
    debug(verbose, f"Using git identity {git_user_name} <{git_user_email}>.")
    git("config", "user.name", git_user_name)
    git("config", "user.email", git_user_email)
    try:
        git("remote", "get-url", "origin")
    except subprocess.CalledProcessError:
        return

    debug(verbose, f"Refreshing {GIT_BRANCH} from origin.")
    git("checkout", GIT_BRANCH)
    git("fetch", "origin", "--tags")
    git("pull", "--ff-only", "origin", GIT_BRANCH)


def existing_upstream_tags() -> set[str]:
    output = git("tag", "--list", "rust-v*").stdout
    return {line.strip() for line in output.splitlines() if line.strip()}


def push_remote_url() -> str:
    return f"https://github.com/{TAP_REPO}.git"


def push_git_env(token: str) -> dict[str, str]:
    return {
        "GIT_ASKPASS": str(REPO_ROOT / "scripts" / "git_askpass.sh"),
        "GIT_TERMINAL_PROMPT": "0",
        "GIT_ASKPASS_USERNAME": "x-access-token",
        "GIT_ASKPASS_PASSWORD": token,
    }


def stage_and_commit(path: Path, release: ReleaseInfo, verbose: bool) -> bool:
    new_content = render_cask(release)
    old_content = path.read_text(encoding="utf-8") if path.exists() else ""
    if old_content == new_content:
        debug(verbose, f"{path.name} already matches {release.tag_name}.")
        return False

    path.write_text(new_content, encoding="utf-8")
    git("add", str(path.relative_to(REPO_ROOT)))
    git("commit", "-m", f"chore(cask): update {release.cask_token} to {release.version}")
    debug(verbose, f"Committed update for {release.tag_name}.")
    return True


def create_tag(tag_name: str, verbose: bool) -> None:
    git("tag", "-a", tag_name, "-m", f"Mirror upstream release {tag_name}")
    debug(verbose, f"Created tag {tag_name}.")


def push_updates(tag_name: str, token: str, push_branch: bool, verbose: bool) -> None:
    url = push_remote_url()
    env = push_git_env(token)
    if push_branch:
        git("push", url, f"HEAD:{GIT_BRANCH}", capture_output=False, env=env)
        time.sleep(1)
    git("push", url, f"refs/tags/{tag_name}", capture_output=False, env=env)
    debug(verbose, f"Pushed {tag_name} to GitHub.")


def release_body(release: ReleaseInfo, *, active_version: str, cask_updated: bool) -> str:
    return "\n".join(
        [
            f"Tap mirror of upstream release `{release.tag_name}`.",
            "",
            f"- Upstream release type: {release.release_type}",
            f"- Upstream release: {release.html_url}",
            f"- Published upstream: {release.published_at}",
            f"- Active cask: `{release.cask_token}`",
            f"- Active cask updated: {'yes' if cask_updated else 'no'}",
            f"- Active cask version after sync: `{active_version}`",
        ]
    )


def create_github_release(release: ReleaseInfo, token: str, active_version: str, cask_updated: bool, verbose: bool) -> None:
    payload = {
        "tag_name": release.tag_name,
        "target_commitish": GIT_BRANCH,
        "name": release.version,
        "body": release_body(release, active_version=active_version, cask_updated=cask_updated),
        "draft": False,
        "prerelease": release.prerelease,
    }
    response = api_request(f"/repos/{TAP_REPO}/releases", token, method="POST", data=payload)
    if isinstance(response, dict) and response.get("already_exists"):
        debug(verbose, f"GitHub Release {release.tag_name} already exists.")
        return
    debug(verbose, f"Created GitHub Release {release.tag_name}.")


def sync_releases(dry_run: bool, verbose: bool) -> int:
    configure_repo(verbose)
    ensure_clean_worktree()

    tags = existing_upstream_tags()
    active_version = read_active_cask_version()
    pending = select_releases_for_sync(tags, GH_TOKEN)
    if not pending:
        log("No new upstream releases.")
        return 0

    log(f"Processing {len(pending)} upstream release(s).")
    for release in pending:
        log(f"Mirroring {release.tag_name} ({release.release_type}).")
        path = release.cask_path
        changed = False
        tag_exists = release.tag_name in tags
        cask_updated = False
        should_promote = release_outranks_active(release, active_version)

        if not dry_run:
            if should_promote:
                changed = stage_and_commit(path, release, verbose)
                active_version = release.version
                cask_updated = changed
            else:
                debug(
                    verbose,
                    f"{release.tag_name} does not outrank active codex {active_version}; leaving codex.rb unchanged.",
                )
            if not tag_exists:
                create_tag(release.tag_name, verbose)
                tags.add(release.tag_name)

            if GH_TOKEN is None:
                raise RuntimeError("GH_TOKEN or GITHUB_TOKEN is required for push/release operations.")

            push_updates(release.tag_name, GH_TOKEN, push_branch=changed, verbose=verbose)
            if active_version is None:
                raise RuntimeError("No active codex version is available after sync.")
            create_github_release(release, GH_TOKEN, active_version, cask_updated, verbose)
        else:
            if should_promote:
                old_content = path.read_text(encoding="utf-8") if path.exists() else ""
                if old_content != render_cask(release):
                    changed = True
                active_version = release.version
                cask_updated = changed
                log(f"dry-run: would {'update' if changed else 'reuse'} {path.name}")
            else:
                log(f"dry-run: would keep {path.name} at {active_version}")
            if not tag_exists:
                log(f"dry-run: would create tag {release.tag_name}")
            if active_version is None:
                raise RuntimeError("No active codex version is available after dry-run planning.")
            log(
                f"dry-run: would create GitHub Release {release.tag_name} "
                f"(active cask updated: {'yes' if cask_updated else 'no'})"
            )

    return 0


def main() -> int:
    args = parse_args()
    try:
        return sync_releases(dry_run=args.dry_run, verbose=args.verbose)
    except Exception as exc:  # noqa: BLE001
        print(f"error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
