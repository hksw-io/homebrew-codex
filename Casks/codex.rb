cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.5"
  sha256 arm:          "b63efce54d875dc89dcfb0dc3deabcf329c632efccccd77aa214a2caf7336010",
         intel:        "1a19a54d8c4fed10c0d4e6f303bcad2a8b42b2d46269b373e3f1b51c769e8e09",
         arm64_linux:  "716f3100a0ba30e87dd57cb43c2abf5b2e3235380e4b7691c7d6cbaf79fae780",
         x86_64_linux: "8222ce2d185b9e83cb978ecb2fa65942e155657a8457f833622d042b38473d2b"

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
