cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.114.0-alpha.3"
  sha256 arm:          "a1ecb1e15a21d3187bcd9ee1cb4ce4d42520390ca3f703b83f7b73b2e468df80",
         intel:        "e53303f3e27d35753d8e78c0944d43f420ff68955308ce4e008086a3c1557d14",
         arm64_linux:  "aabb21e33a9e8b719b23bba14a9452a02522d69642f2969c9657bd6986b06564",
         x86_64_linux: "0e5a11760159d2a45bc8b98c0ab3d1cd16fc92962fd34af943f83be36200202f"

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
