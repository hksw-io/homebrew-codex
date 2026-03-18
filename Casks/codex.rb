cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.5"
  sha256 arm:          "163043620690dc026bf21fd6a7df51fe71ab9d2d4ef83181a3565183ec966a7c",
         intel:        "0087094d59e60116f50864bfa8ed7e2cf35a91b4ff5a732ed81241447485a5f1",
         arm64_linux:  "93b84d1345e56a99b0303d0a0f0b80baa6cc558f944fa1371a15b2dc02ed71c9",
         x86_64_linux: "e89977a13869b659fc7431f21594bc3609ea11621a12cf0c0e08422c7a4df011"

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
