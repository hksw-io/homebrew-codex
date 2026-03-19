cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.10"
  sha256 arm:          "1097b37b2c1be751adc04554a55917991d4c00158d40cf545f4d54bdff6905e6",
         intel:        "5cf29f42b091d5090a982d3f44b5c339d58a4ad47647c972439ae77f5797b745",
         arm64_linux:  "58e0015f58686bdf591676cec4559dd5b52122d5a378ee11b92a5c82ff186869",
         x86_64_linux: "f3109730832c2c6e5b78e49cae12ab8bdfa853bf1bd0853074c6d7d0aa12ae3f"

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
