cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.6"
  sha256 arm:          "24c17e2f4dca1ec7ed3ff0a8f4774dd7118b09cdb96a3b91f7239a1f3c70e7c5",
         intel:        "787c32f80cb8a04460c7a40abc18202e901eb17c0213fdb21aaa5f302ca6cdc1",
         arm64_linux:  "bf35d89ba482b7422c2d513ec1b8101c51b0ea006320d8573b0202e472a55c19",
         x86_64_linux: "ef947091c91e45d9467f1d5d27ff2e08de0af85e564075fd68b68b3eff0bf11d"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
