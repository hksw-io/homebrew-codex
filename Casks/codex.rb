cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.7"
  sha256 arm:          "bb2b9330b8163361dab808f6658102bf694d66ea4ebaa52d0b0b67b7ab0f6c8c",
         intel:        "e79113807d2532869faef5979f23c9a59f915e33551dde8a44fd8a2daecad51d",
         arm64_linux:  "d7992a1ef825029a511201d225c789c206a362955c20197b544829128e2044f9",
         x86_64_linux: "d8d3dd507985ffbfad270d0fb36c1dc3d26baf1aa4ec47ce1650b61563877bdb"

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
