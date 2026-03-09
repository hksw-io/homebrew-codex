# Homebrew Tap for Codex

Community-maintained Homebrew tap for stable and alpha Codex releases, mirrored from `openai/codex`.

## Why This Exists

The official Homebrew `codex` cask is a good default if you only want stable releases. This tap exists for two cases:

- upstream is moving quickly and you want a dedicated mirror that checks for new releases every 5 minutes
- you want alpha releases, which the official cask does not publish

The official Homebrew cask tracks stable `rust-v...` releases only. This tap also tracks upstream prereleases such as `rust-v0.113.0-alpha.1`.

## Install

Stable:

```sh
brew install --cask hksw-io/codex/codex
```

Alpha:

```sh
brew install --cask hksw-io/codex/codex@alpha
```

Upgrade:

```sh
brew upgrade --cask hksw-io/codex/codex
brew upgrade --cask hksw-io/codex/codex@alpha
```

Notes:

- `hksw-io/codex` is the tap name, not the install target.
- `brew install --cask codex` installs the official Homebrew cask, not this tap.
- `codex` and `codex@alpha` both install the `codex` binary, so they conflict with each other.

## Channels

| Channel | Tracks | Install |
| --- | --- | --- |
| Stable | Latest stable `rust-v...` release from `openai/codex` | `brew install --cask hksw-io/codex/codex` |
| Alpha | Latest prerelease `rust-v...-alpha.N` release from `openai/codex` | `brew install --cask hksw-io/codex/codex@alpha` |

## How It Works

This tap polls the upstream GitHub Releases API every 5 minutes and mirrors only `rust-v...` releases from `openai/codex`.

Each mirrored release:

- updates the relevant cask in this repo
- creates a matching git tag
- creates a GitHub Release in `hksw-io/homebrew-codex`

## Run It Yourself

Clone the repo wherever you want to run the mirror:

```sh
git clone https://github.com/hksw-io/homebrew-codex.git
cd homebrew-codex
```

Create an environment file. The default location is `${XDG_CONFIG_HOME:-$HOME/.config}/codex-tap.env`, but every helper script also accepts an explicit path:

```sh
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"
cat > "${XDG_CONFIG_HOME:-$HOME/.config}/codex-tap.env" <<'EOF'
GH_TOKEN=...
TAP_REPO=hksw-io/homebrew-codex
UPSTREAM_REPO=openai/codex
GIT_BRANCH=master
GIT_USER_NAME="Your Name"
GIT_USER_EMAIL="you@example.com"
EOF
chmod 600 "${XDG_CONFIG_HOME:-$HOME/.config}/codex-tap.env"
```

Run the updater once:

```sh
./scripts/run_update.sh --dry-run --verbose
```

Run the tests:

```sh
python3 -m unittest discover -s tests -v
```

Automate it on Linux with `systemd`:

```sh
sudo ./scripts/install_systemd_units.sh "${XDG_CONFIG_HOME:-$HOME/.config}/codex-tap.env"
systemctl status codex-tap-sync.timer
systemctl list-timers codex-tap-sync.timer
```

Automate it on macOS with `launchd`:

```sh
./scripts/install_launchd_agent.sh "${XDG_CONFIG_HOME:-$HOME/.config}/codex-tap.env"
launchctl print "gui/$(id -u)/io.hksw.codex-tap-sync"
```

Notes:

- The helper scripts render the scheduler config with your actual clone path, so you do not need to use `/srv/homebrew-codex`.
- `GH_TOKEN` needs permission to read `openai/codex` releases and write to `hksw-io/homebrew-codex`.
- Set `GIT_USER_NAME` and `GIT_USER_EMAIL` if you want mirrored commits to use a specific identity. If unset, the updater falls back to the repo's local git config.
- The Linux installer defaults to running the timer as the invoking user. Override `CODEX_TAP_USER`, `CODEX_TAP_GROUP`, or `CODEX_TAP_HOME` if you want a dedicated service account.
