cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.130.0-alpha.3"
  sha256 arm:          "54ef3ebabc3ad0bad87078fd3dd3533a43b3b0b0aac78172a12cf166e33a876a",
         intel:        "41397a43f47c153b9cbb14843bc4f17a721d3a0978c1efeb7ca82d736431168a",
         arm64_linux:  "5bbdf91cf8269106ec1eba32429f8e5400cc33a5a9e42243253fbbba6c3e052d",
         x86_64_linux: "3c65175381d2e76a33366a5ec7b3a16bae69099e7ef0d6a73b31883e65cbec44"

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
