cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.118.0-alpha.4"
  sha256 arm:          "ffc4f2efa0217ad6fc158b50c3a9034fec51ce7020c36333134907f661ee4feb",
         intel:        "9b83f8e9f324b0ccf103c7a67ebb378486457e962040032ac145d89146b1febf",
         arm64_linux:  "d362920a64f39e7f212878d5d40536ade6c164a969ea545dc99517881f7facad",
         x86_64_linux: "c637512d7db17e9b279fb0eb62dcf36085ca8fe822d5aa882e7f4b2b64b5175b"

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
