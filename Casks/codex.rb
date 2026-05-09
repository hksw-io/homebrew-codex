cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.1"
  sha256 arm:          "37885dde4a5b5c8e987d894a43ac131e70434b3d31f23d2715bd5fcb78d523df",
         intel:        "818bbb08f60b227bce402ea2f5ad929056680d6282323b3124ac935600857a00",
         arm64_linux:  "76b1b4fee03012c3b053a736f27d8d3546a8cd5acd28fc92af15dcbef64a3a9e",
         x86_64_linux: "b3f1ca2265f14e64b23e195dff5c2263d208e5efcbcf6110208f90502f0e8610"

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
