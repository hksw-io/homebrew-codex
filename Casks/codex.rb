cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.8"
  sha256 arm:          "d0dcdc8dc174c21b734e05e044fc341c1bb5b0cf8162dc8e6cf032466e88166e",
         intel:        "70400ac7cdf3b15c59469b923928782a768f8467dfda2c63d2a9bad4a61a0391",
         arm64_linux:  "bc63c60d0c814f493930a43df340903b66021c5fcc7d5acc7bf74a37955d3aad",
         x86_64_linux: "733153f2f6b2a1fc61ba26f5d18ffd60ab1cc89da06cc9b9ebb8e08f5561403e"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-[0-9a-z-]+(?:\.[0-9a-z-]+)*)?(?:\+[0-9a-z-]+(?:\.[0-9a-z-]+)*)?)$/i)
    strategy :github_releases
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
