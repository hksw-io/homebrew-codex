from __future__ import annotations

import http.client
import io
import os
import sys
import unittest
import urllib.error
from pathlib import Path
from unittest import mock


sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import update_codex_tap as updater  # noqa: E402


class ReleaseParsingTests(unittest.TestCase):
    def make_release(self, *, tag_name: str, prerelease: bool, published_at: str) -> dict:
        assets = []
        for digest_key, asset_names in updater.REQUIRED_ASSETS.items():
            assets.append(
                {
                    "name": asset_names[0],
                    "digest": f"sha256:{digest_key * 8}"[:71],
                }
            )

        return {
            "tag_name": tag_name,
            "prerelease": prerelease,
            "published_at": published_at,
            "html_url": f"https://example.invalid/{tag_name}",
            "assets": assets,
        }

    def test_release_from_api_extracts_version_release_type_and_digests(self) -> None:
        release = updater.release_from_api(
            self.make_release(
                tag_name="rust-v0.113.0-alpha.1",
                prerelease=True,
                published_at="2026-03-09T01:22:30Z",
            )
        )
        self.assertEqual(release.version, "0.113.0-alpha.1")
        self.assertEqual(release.release_type, "prerelease")
        self.assertEqual(release.cask_token, "codex")
        self.assertEqual(release.asset_names["arm"], "codex-package-aarch64-apple-darwin.tar.gz")
        self.assertEqual(sorted(release.sha256), sorted(updater.REQUIRED_ASSETS))

    def test_release_from_api_rejects_bare_assets(self) -> None:
        release_item = self.make_release(
            tag_name="rust-v0.144.0",
            prerelease=False,
            published_at="2026-05-31T01:22:30Z",
        )
        release_item["assets"][0]["name"] = "codex-aarch64-apple-darwin.tar.gz"

        with self.assertRaisesRegex(ValueError, "missing required asset variant for arm"):
            updater.release_from_api(release_item)

    def test_version_key_orders_stable_after_same_base_alpha(self) -> None:
        self.assertGreater(
            updater.version_key("0.113.0"),
            updater.version_key("0.113.0-alpha.2"),
        )

    def test_version_key_orders_higher_minor_alpha_after_lower_stable(self) -> None:
        self.assertGreater(
            updater.version_key("0.114.0-alpha.1"),
            updater.version_key("0.113.1"),
        )

    def test_version_key_orders_multi_part_prereleases(self) -> None:
        self.assertGreater(
            updater.version_key("0.146.0-alpha.5"),
            updater.version_key("0.146.0-alpha.3.1"),
        )
        self.assertGreater(
            updater.version_key("0.146.0-alpha.10"),
            updater.version_key("0.146.0-alpha.9.2"),
        )
        self.assertGreater(
            updater.version_key("0.146.0-alpha.10.1"),
            updater.version_key("0.146.0-alpha.10"),
        )

    def test_version_key_supports_semver_prerelease_identifiers(self) -> None:
        self.assertGreater(
            updater.version_key("0.147.0-rc.1"),
            updater.version_key("0.147.0-beta.9"),
        )
        self.assertGreater(
            updater.version_key("0.147.0"),
            updater.version_key("0.147.0-rc.1"),
        )

    def test_release_outranks_active_uses_semver_precedence(self) -> None:
        release = updater.release_from_api(
            self.make_release(
                tag_name="rust-v0.114.0-alpha.1",
                prerelease=True,
                published_at="2026-03-08T20:44:14Z",
            )
        )
        self.assertTrue(updater.release_outranks_active(release, "0.113.1"))
        self.assertFalse(updater.release_outranks_active(release, "0.114.0"))

    def test_render_cask_tracks_stable_and_alpha_tags(self) -> None:
        release = updater.release_from_api(
            self.make_release(
                tag_name="rust-v0.113.0",
                prerelease=False,
                published_at="2026-03-09T01:22:30Z",
            )
        )
        content = updater.render_cask(release)
        self.assertIn('cask "codex"', content)
        self.assertIn("(?:-[0-9a-z-]+(?:\\.[0-9a-z-]+)*)?", content)
        self.assertIn("strategy :github_releases", content)
        self.assertIn('arch arm: "aarch64", intel: "x86_64"', content)
        self.assertIn('os macos: "apple-darwin", linux: "unknown-linux-musl"', content)
        self.assertIn('generate_completions_from_executable', content)
        self.assertEqual(content.count('binary "bin/codex"'), 1)
        self.assertNotIn('binary "bin/codex-code-mode-host"', content)
        self.assertNotIn('depends_on formula: "ripgrep"', content)
        self.assertNotIn("conflicts_with", content)

    def test_render_cask_uses_package_asset_urls(self) -> None:
        content = updater.render_cask(
            updater.release_from_api(
                self.make_release(
                    tag_name="rust-v0.144.0",
                    prerelease=False,
                    published_at="2026-07-09T16:47:12Z",
                )
            )
        )
        self.assertIn("codex-package-#{arch}-#{os}.tar.gz", content)

    def test_fetch_release_page_limits_large_upstream_payloads(self) -> None:
        with mock.patch.object(updater, "api_request", return_value=[]) as api_request:
            self.assertEqual(updater.fetch_release_page(3, None), [])
        api_request.assert_called_once_with(
            f"/repos/openai/codex/releases?per_page={updater.RELEASES_PER_PAGE}&page=3",
            None,
        )

    def test_api_request_retries_gateway_timeout(self) -> None:
        error = urllib.error.HTTPError(
            url="https://api.github.com/repos/openai/codex/releases",
            code=504,
            msg="Gateway Timeout",
            hdrs={},
            fp=io.BytesIO(b"gateway timeout"),
        )
        response = mock.MagicMock()
        response.__enter__.return_value.read.return_value = b"[]"

        with mock.patch("urllib.request.urlopen", side_effect=[error, response]):
            with mock.patch("time.sleep") as sleep:
                self.assertEqual(updater.api_request("/repos/openai/codex/releases", None), [])
        sleep.assert_called_once_with(1)

    def test_api_request_retries_incomplete_response(self) -> None:
        incomplete = mock.MagicMock()
        incomplete.__enter__.return_value.read.side_effect = http.client.IncompleteRead(b"", 10)
        response = mock.MagicMock()
        response.__enter__.return_value.read.return_value = b"[]"

        with mock.patch("urllib.request.urlopen", side_effect=[incomplete, response]):
            with mock.patch("time.sleep") as sleep:
                self.assertEqual(updater.api_request("/repos/openai/codex/releases", None), [])
        sleep.assert_called_once_with(1)

    def test_select_releases_for_sync_bootstrap_picks_highest_semver_release(self) -> None:
        first_page = [
            self.make_release(
                tag_name="rust-v0.113.1",
                prerelease=False,
                published_at="2026-03-10T04:00:00Z",
            ),
            self.make_release(
                tag_name="rust-v0.114.0-alpha.1",
                prerelease=True,
                published_at="2026-03-09T04:00:00Z",
            ),
        ]
        with mock.patch.object(updater, "fetch_release_page", side_effect=[first_page, []]):
            selected = updater.select_releases_for_sync(set(), None)
        self.assertEqual([release.tag_name for release in selected], ["rust-v0.114.0-alpha.1"])

    def test_select_releases_for_sync_does_not_stop_at_first_known_tag(self) -> None:
        first_page = [
            self.make_release(
                tag_name="rust-v0.113.0",
                prerelease=False,
                published_at="2026-03-10T05:25:19Z",
            ),
            self.make_release(
                tag_name="rust-v0.114.0-alpha.1",
                prerelease=True,
                published_at="2026-03-10T06:54:03Z",
            ),
            self.make_release(
                tag_name="rust-v0.99.0-alpha.24",
                prerelease=True,
                published_at="2026-03-08T21:50:29Z",
            ),
        ]
        second_page = [
            self.make_release(
                tag_name="rust-v0.113.0-alpha.1",
                prerelease=True,
                published_at="2026-03-09T17:58:33Z",
            ),
            self.make_release(
                tag_name="rust-v0.112.0",
                prerelease=False,
                published_at="2026-03-09T17:58:31Z",
            ),
        ]
        existing_tags = {"rust-v0.113.0", "rust-v0.113.0-alpha.2", "rust-v0.113.0-alpha.1", "rust-v0.112.0"}
        with mock.patch.object(updater, "fetch_release_page", side_effect=[first_page, second_page]) as fetch_release_page:
            pending = updater.select_releases_for_sync(existing_tags, None)
        self.assertEqual([release.tag_name for release in pending], ["rust-v0.114.0-alpha.1"])
        self.assertEqual(fetch_release_page.call_count, 2)

    def test_push_remote_url_does_not_embed_credentials(self) -> None:
        self.assertEqual(
            updater.push_remote_url(),
            "https://github.com/hksw-io/homebrew-codex.git",
        )

    def test_resolve_git_identity_prefers_environment(self) -> None:
        with mock.patch.dict(
            os.environ,
            {
                "GIT_USER_NAME": "Test User",
                "GIT_USER_EMAIL": "test@example.com",
            },
            clear=False,
        ):
            with mock.patch.object(updater, "GIT_USER_NAME", "Test User"):
                with mock.patch.object(updater, "GIT_USER_EMAIL", "test@example.com"):
                    self.assertEqual(
                        updater.resolve_git_identity(),
                        ("Test User", "test@example.com"),
                    )

    def test_resolve_git_identity_falls_back_to_git_config(self) -> None:
        with mock.patch.object(updater, "GIT_USER_NAME", None):
            with mock.patch.object(updater, "GIT_USER_EMAIL", None):
                with mock.patch.object(updater, "git_config_value", side_effect=["Test User", "test@example.com"]):
                    self.assertEqual(
                        updater.resolve_git_identity(),
                        ("Test User", "test@example.com"),
                    )

    def test_resolve_git_identity_requires_complete_identity(self) -> None:
        with mock.patch.object(updater, "GIT_USER_NAME", None):
            with mock.patch.object(updater, "GIT_USER_EMAIL", None):
                with mock.patch.object(updater, "git_config_value", side_effect=[None, None]):
                    with self.assertRaisesRegex(RuntimeError, "Git commit identity is not configured"):
                        updater.resolve_git_identity()

    def test_ensure_repo_writable_passes_when_all_paths_are_writable(self) -> None:
        with mock.patch("os.access", return_value=True):
            updater.ensure_repo_writable()

    def test_ensure_repo_writable_reports_unwritable_paths(self) -> None:
        def fake_access(path: object, mode: int) -> bool:
            return "codex.rb" not in str(path) and "refs/heads/master" not in str(path)

        with mock.patch("os.access", side_effect=fake_access):
            with self.assertRaisesRegex(RuntimeError, "Repository is not writable by the current user"):
                updater.ensure_repo_writable()


if __name__ == "__main__":
    unittest.main()
