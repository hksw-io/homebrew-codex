cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.11"
  sha256 arm:          "64b831e0dd11cdab1333ce3ce49f50ef175e16677ed83d3ccbf58e42bf901a85",
         intel:        "8611e64a3c9173074b97caed0cb18fc25461303c6a94bfe4b47ab5b7d2a9b009",
         arm64_linux:  "3be9f9acc06553071782d1fe5cc08c998cb3f27a2e867a0a8aae6ad5baf2c322",
         x86_64_linux: "10bec627495eb2f2932854583721ba35498cf6963c7c8a83c9f945bea97dd90e"

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
