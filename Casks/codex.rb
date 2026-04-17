cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.6"
  sha256 arm:          "7c9eac09df10d7a2275dd60df929677f97fab1be9eb90abd809a01d766f50f2a",
         intel:        "784182d0926b11381a7ccb14178a461508709409b490d97b5df2dcd520e4ba1e",
         arm64_linux:  "e848d185accd24c6cc12c2319b245a99b95b0154e9f1604266ac8d201cd465dc",
         x86_64_linux: "112a43f3f3b76e4216114380ad10dfceb1daad396a0cb76d1c8e24f8e83f2e96"

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
