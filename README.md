# HKSW Codex Tap

Homebrew tap for `openai/codex` with stable and alpha channels.

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

- `codex` tracks the latest stable `rust-v...` release from `openai/codex`.
- `codex@alpha` tracks the latest prerelease `rust-v...-alpha.N` release from `openai/codex`.

## How It Works

This tap is mirrored from upstream GitHub Releases for `openai/codex`.

The updater polls the upstream releases API every 5 minutes and only considers `rust-v...` tags. Each mirrored release becomes:

1. a cask update in this repo,
2. a matching git tag,
3. a GitHub Release in `hksw-io/homebrew-codex`.

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
