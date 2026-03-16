cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.1"
  sha256 arm:          "de2d9b0895652d532ca909b1b9437d3fdeb5275533fd24114211f16e1787eb7c",
         intel:        "7227a062a3efc2ed94c7a07f5751be5aecbbfd908039b015b4929e0cbff80310",
         arm64_linux:  "b33c70b4f300efadf029e69f250e387b28a1d3eebea6b9f632642c6dc5e66f8e",
         x86_64_linux: "3f7091680959c0984ffdba9e7160c0665885cc2f9adb946ac6e9cdf0608eced7"

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
