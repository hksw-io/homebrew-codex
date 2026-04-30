cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.128.0-alpha.1"
  sha256 arm:          "037f854f481c82d6fc7037aa30a42b177e6f7289b178a0519cec6825e894d08b",
         intel:        "c464507e543ffe969555143a7d14295ee56dbcc6946d7a5106ddd0b653588260",
         arm64_linux:  "6588dbc10a32b6ab72bac2eb7873f852745d4a77de4f77a08059f15d33c00389",
         x86_64_linux: "b3cfc9ee1989db8da681dfa8a43803d90c42cbb93cbfc41b5195e27c237c3e2f"

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
