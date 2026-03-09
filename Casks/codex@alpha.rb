cask "codex@alpha" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.113.0-alpha.2"
  sha256 arm:          "86eebd9f571609a619374a563715dbd56d6fc4320247c2662da931d95331e370",
         intel:        "1c62810d0ef73d55d1f54e6bba36b654537531cd263a4a4b9ff99d8c7937dfb4",
         arm64_linux:  "a7d14dd16e5fb7d0f56689e43749501540026adf75f35664bf0122aff0ea2817",
         x86_64_linux: "148c847d31ba3b32592d30737b17617f63dfeae043381aba635753c4f9b29d3e"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+-alpha\.\d+)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  conflicts_with cask: "codex"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
