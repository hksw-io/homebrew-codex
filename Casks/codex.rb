cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.11"
  sha256 arm:          "60d211bf176a29bfe4ea5d984baf2789445e406f737bf2d7243e56da0653155d",
         intel:        "2c60eaa34c72bc8583ab16d91d66f5141eec8ec9673e06383090befeae3fd6bf",
         arm64_linux:  "218304d1800a891d7593e77e572f651126ad4b4d3962d62f1403558926b3988b",
         x86_64_linux: "5a0ca9d3ec5847164624d2a9e07e41fd1a90e2692a9cc2ff7c0367557c949315"

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
