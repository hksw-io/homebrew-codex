cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.2"
  sha256 arm:          "c9d4de7b021a5ec0f691b163c1b3e7c0e42f23f03b0c6e5402ebf6aa444a5a01",
         intel:        "f80a9194abcf93073102d2893407a2d02fdd84fcc5989c2510fb439d4a9fe433",
         arm64_linux:  "cb1d3f943929eb024ecbe0573844baa812833d5d1f9ea7376e90ea21724b1c08",
         x86_64_linux: "0b07de59cd986fda250bce45f025dfe9bce2f285de20418a3ac60c94ab9b0d67"

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
