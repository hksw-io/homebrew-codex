from __future__ import annotations

import contextlib
import io
import sys
import unittest
from datetime import datetime, timezone
from pathlib import Path
from types import SimpleNamespace
from unittest import mock


sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import update_codex_tap as updater  # noqa: E402


class AssetReadinessTests(unittest.TestCase):
    def make_release(self, version: str, published_at: str) -> dict:
        return {
            "tag_name": f"rust-v{version}",
            "published_at": published_at,
            "prerelease": True,
            "html_url": f"https://example.invalid/rust-v{version}",
            "assets": [
                {"name": names[0], "digest": "sha256:" + "a" * 64}
                for names in updater.REQUIRED_ASSETS.values()
            ],
        }

    def setUp(self) -> None:
        self.known = self.make_release("0.163.0-alpha.1", "2026-10-16T08:00:00Z")
        self.older = self.make_release("0.163.0-alpha.2", "2026-10-16T09:00:00Z")
        self.incomplete = self.make_release("0.163.0-alpha.3", "2026-10-16T09:30:00Z")
        self.newer = self.make_release("0.163.0-alpha.4", "2026-10-16T09:45:00Z")
        self.missing_asset = self.incomplete["assets"].pop(0)
        self.published_timestamp = datetime(2026, 10, 16, 9, 30, tzinfo=timezone.utc).timestamp()
        self.clock = self.enterContext(mock.patch.object(updater.time, "time", return_value=self.published_timestamp + 60))

    def select(self, tags: set[str]) -> list[updater.ReleaseInfo]:
        # Deliberately use reverse API order, with the known release on another page.
        with mock.patch.object(updater, "fetch_release_page", side_effect=[
            [self.newer, self.incomplete, self.older], [self.known],
        ]):
            return updater.select_releases_for_sync(tags, None)

    def test_wait_preserves_prefix_and_retries_blocked_release_next_run(self) -> None:
        tags = {self.known["tag_name"]}
        with mock.patch.object(updater, "release_from_api", wraps=updater.release_from_api) as parse:
            with mock.patch.object(updater, "log") as log:
                ready = self.select(tags)
        self.assertEqual([release.tag_name for release in ready], [self.older["tag_name"]])
        self.assertEqual([call.args[0]["tag_name"] for call in parse.call_args_list], [
            self.older["tag_name"], self.incomplete["tag_name"],
        ])
        self.assertIn("Waiting for assets on rust-v0.163.0-alpha.3", log.call_args.args[0])

        tags.add(self.older["tag_name"])
        with mock.patch.object(updater, "log"):
            self.assertEqual(self.select(tags), [])

        self.incomplete["assets"].append(self.missing_asset)
        ready = self.select(tags)
        self.assertEqual([release.tag_name for release in ready], [
            self.incomplete["tag_name"], self.newer["tag_name"],
        ])

    def test_recent_missing_archives_wait_for_each_platform(self) -> None:
        for key, names in updater.REQUIRED_ASSETS.items():
            for age_seconds in (0, 7199):
                with self.subTest(platform=key, age_seconds=age_seconds):
                    item = self.make_release("0.163.0-alpha.3", "2026-10-16T09:30:00Z")
                    item["assets"] = [asset for asset in item["assets"] if asset["name"] not in names]
                    self.clock.return_value = self.published_timestamp + age_seconds
                    with mock.patch.object(updater, "log"):
                        self.assertEqual(updater.ready_releases_from_api([item]), [])

    def test_missing_archives_fail_at_two_hours_and_after(self) -> None:
        for age_seconds in (7200, 7201, 86400):
            with self.subTest(age_seconds=age_seconds):
                self.clock.return_value = self.published_timestamp + age_seconds
                with self.assertRaisesRegex(updater.MissingReleaseAsset, "missing required asset variant for arm"):
                    self.select({self.known["tag_name"]})

    def test_recent_release_with_missing_digest_still_fails(self) -> None:
        item = self.make_release("0.163.0-alpha.3", "2026-10-16T09:30:00Z")
        item["assets"][0].pop("digest")
        with self.assertRaisesRegex(ValueError, "no sha256 digest"):
            updater.ready_releases_from_api([item])

    def test_invalid_publication_time_fails_instead_of_waiting_forever(self) -> None:
        self.incomplete["published_at"] = "invalid"
        with self.assertRaises(ValueError):
            updater.ready_releases_from_api([self.incomplete])

    def test_bootstrap_waits_for_highest_version_without_falling_back(self) -> None:
        self.newer["assets"] = []
        with mock.patch.object(updater, "fetch_release_page", side_effect=[
            [self.newer, self.known], [],
        ]):
            with mock.patch.object(updater, "log"):
                self.assertEqual(updater.select_releases_for_sync(set(), None), [])

    def test_main_waits_successfully_then_errors_at_deadline(self) -> None:
        for age_seconds, expected_exit in ((7199, 0), (7200, 1)):
            with self.subTest(age_seconds=age_seconds):
                self.clock.return_value = self.published_timestamp + age_seconds
                stderr = io.StringIO()
                with contextlib.ExitStack() as stack:
                    stack.enter_context(mock.patch.object(updater, "parse_args", return_value=SimpleNamespace(dry_run=False, verbose=False)))
                    stack.enter_context(mock.patch.object(updater, "prepare_repository"))
                    stack.enter_context(mock.patch.object(updater, "existing_upstream_tags", return_value={self.known["tag_name"]}))
                    stack.enter_context(mock.patch.object(updater, "read_active_cask_version", return_value="0.163.0-alpha.1"))
                    stack.enter_context(mock.patch.object(updater, "fetch_release_page", side_effect=[[self.newer, self.incomplete], [self.known]]))
                    stack.enter_context(contextlib.redirect_stdout(io.StringIO()))
                    stack.enter_context(contextlib.redirect_stderr(stderr))
                    stage = stack.enter_context(mock.patch.object(updater, "stage_and_commit"))
                    tag = stack.enter_context(mock.patch.object(updater, "create_tag"))
                    push = stack.enter_context(mock.patch.object(updater, "push_updates"))
                    publish = stack.enter_context(mock.patch.object(updater, "create_github_release"))
                    self.assertEqual(updater.main(), expected_exit)
                for mutation in (stage, tag, push, publish):
                    mutation.assert_not_called()
                if expected_exit:
                    self.assertIn("error: Release rust-v0.163.0-alpha.3 is missing", stderr.getvalue())
                else:
                    self.assertEqual(stderr.getvalue(), "")

    def test_sync_mirrors_only_the_ready_prefix_before_waiting(self) -> None:
        with contextlib.ExitStack() as stack:
            stack.enter_context(mock.patch.object(updater, "prepare_repository"))
            stack.enter_context(mock.patch.object(updater, "existing_upstream_tags", return_value={self.known["tag_name"]}))
            stack.enter_context(mock.patch.object(updater, "read_active_cask_version", return_value="0.163.0-alpha.1"))
            stack.enter_context(mock.patch.object(updater, "fetch_release_page", side_effect=[[self.newer, self.incomplete, self.older], [self.known]]))
            stack.enter_context(mock.patch.object(updater, "GH_TOKEN", "test-token"))
            stack.enter_context(contextlib.redirect_stdout(io.StringIO()))
            stage = stack.enter_context(mock.patch.object(updater, "stage_and_commit", return_value=True))
            tag = stack.enter_context(mock.patch.object(updater, "create_tag"))
            push = stack.enter_context(mock.patch.object(updater, "push_updates"))
            publish = stack.enter_context(mock.patch.object(updater, "create_github_release"))
            self.assertEqual(updater.sync_releases(dry_run=False, verbose=False), 0)
        stage.assert_called_once()
        self.assertEqual(stage.call_args.args[1].tag_name, self.older["tag_name"])
        tag.assert_called_once_with(self.older["tag_name"], False)
        push.assert_called_once_with(self.older["tag_name"], "test-token", push_branch=True, verbose=False)
        publish.assert_called_once()
        self.assertEqual(publish.call_args.args[0].tag_name, self.older["tag_name"])


if __name__ == "__main__":
    unittest.main()
