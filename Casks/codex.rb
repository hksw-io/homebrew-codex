cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.18"
  sha256 arm:          "24556a3e3834fcd0d066b0c986213c01a7af3a68286e7e24a8a57ef46adba7b1",
         intel:        "7183da1762a479a7bcf9dfbf0c6d275a64b9219dfd9d758a393390aa7df6e8d3",
         arm64_linux:  "ad6b33d192bcae270fa2d2b838ab23a7fa718d5094da5609b32b863124df470e",
         x86_64_linux: "b51f41eac1c71dc8d9fa0a3b8934cb7854e494ab8d72d3bf21a4d7d4668b35a8"

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
