cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.9"
  sha256 arm:          "130b33957eb1d16f97a217de3997c6345e4c7de81ed53424c0c41583870ab806",
         intel:        "19c82bb71baf57959fb074145f17a34f8f866264c93f24d6b41412e7ecca2154",
         arm64_linux:  "21e298356fef2d94f6869082916d5110c8c6e288a9948e2d4e3c85561d919384",
         x86_64_linux: "d4ec9fab4197e51a077a4e27a234432345b7a231120d0fa2b072322e4fcdb498"

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
