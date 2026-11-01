cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.167.0-alpha.3"
  sha256 arm:          "358acc29c90498d4bc22c1dd0f7c431d828231ab115d1ce18be606e5844c3abf",
         intel:        "cb2404a20d4a1c8bd1bd020410294ef52f376136cedaa7b59232a8b14e1c3e27",
         arm64_linux:  "c88e7f0fb19d9df9405a612238343c21fbf313de33d24d4003eeb117202a9cec",
         x86_64_linux: "46be4af5956a106243a2350bb964b3fa429e6bc23dbf8fc26258dd2f66a10d78"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-[0-9a-z-]+(?:\.[0-9a-z-]+)*)?(?:\+[0-9a-z-]+(?:\.[0-9a-z-]+)*)?)$/i)
    strategy :github_releases
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
