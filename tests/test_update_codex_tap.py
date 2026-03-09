from __future__ import annotations

import os
import sys
import unittest
from pathlib import Path
from unittest import mock


sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import update_codex_tap as updater  # noqa: E402


class ReleaseParsingTests(unittest.TestCase):
    def make_release(self, *, tag_name: str, prerelease: bool, published_at: str) -> dict:
        assets = []
        for digest_key, asset_name in updater.REQUIRED_ASSETS.items():
            assets.append(
                {
                    "name": asset_name,
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

    def test_release_from_api_extracts_version_channel_and_digests(self) -> None:
        release = updater.release_from_api(
            self.make_release(
                tag_name="rust-v0.113.0-alpha.1",
                prerelease=True,
                published_at="2026-03-09T01:22:30Z",
            )
        )
        self.assertEqual(release.version, "0.113.0-alpha.1")
        self.assertEqual(release.channel, "alpha")
        self.assertEqual(release.cask_token, "codex@alpha")
        self.assertEqual(sorted(release.sha256), sorted(updater.REQUIRED_ASSETS))

    def test_render_cask_for_stable_contains_conflict_and_livecheck(self) -> None:
        release = updater.release_from_api(
            self.make_release(
                tag_name="rust-v0.112.0",
                prerelease=False,
                published_at="2026-03-08T20:44:14Z",
            )
        )
        content = updater.render_cask(release)
        self.assertIn('cask "codex"', content)
        self.assertIn('conflicts_with cask: "codex@alpha"', content)
        self.assertIn("strategy :github_latest", content)

    def test_render_cask_for_alpha_contains_alpha_regex(self) -> None:
        release = updater.release_from_api(
            self.make_release(
                tag_name="rust-v0.113.0-alpha.1",
                prerelease=True,
                published_at="2026-03-09T01:22:30Z",
            )
        )
        content = updater.render_cask(release)
        self.assertIn('cask "codex@alpha"', content)
        self.assertIn('-alpha\\.\\d+', content)
        self.assertIn('conflicts_with cask: "codex"', content)

    def test_push_remote_url_does_not_embed_credentials(self) -> None:
        self.assertEqual(
            updater.push_remote_url(),
            "https://github.com/hksw-io/homebrew-codex.git",
        )

    def test_resolve_git_identity_prefers_environment(self) -> None:
        with mock.patch.dict(
            os.environ,
            {
                "GIT_USER_NAME": "Robin Hallabro-Kokko",
                "GIT_USER_EMAIL": "robin@hallabro-kokko.se",
            },
            clear=False,
        ):
            with mock.patch.object(updater, "GIT_USER_NAME", "Robin Hallabro-Kokko"):
                with mock.patch.object(updater, "GIT_USER_EMAIL", "robin@hallabro-kokko.se"):
                    self.assertEqual(
                        updater.resolve_git_identity(),
                        ("Robin Hallabro-Kokko", "robin@hallabro-kokko.se"),
                    )

    def test_resolve_git_identity_falls_back_to_git_config(self) -> None:
        with mock.patch.object(updater, "GIT_USER_NAME", None):
            with mock.patch.object(updater, "GIT_USER_EMAIL", None):
                with mock.patch.object(updater, "git_config_value", side_effect=["Robin Hallabro-Kokko", "robin@hallabro-kokko.se"]):
                    self.assertEqual(
                        updater.resolve_git_identity(),
                        ("Robin Hallabro-Kokko", "robin@hallabro-kokko.se"),
                    )

    def test_resolve_git_identity_requires_complete_identity(self) -> None:
        with mock.patch.object(updater, "GIT_USER_NAME", None):
            with mock.patch.object(updater, "GIT_USER_EMAIL", None):
                with mock.patch.object(updater, "git_config_value", side_effect=[None, None]):
                    with self.assertRaisesRegex(RuntimeError, "Git commit identity is not configured"):
                        updater.resolve_git_identity()


if __name__ == "__main__":
    unittest.main()
