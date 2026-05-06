cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.12"
  sha256 arm:          "b17b8022fc470dd711c42223bb9db28d11e4215a034bbbf639481ee6dea3178e",
         intel:        "3c6637ea815ec1d8aff1e60436b46c7657b5d15f0d9e42bde00939fdbafb4f24",
         arm64_linux:  "72d8482e0a24b57cef9c353ba1fa01c19c9bc6fd1dd6ae4dbf936c3f1e758160",
         x86_64_linux: "f1b100a6b7ff1e905d2f72778c5aab7c6b1e74e1627b2526a14b28f8ab878c9f"

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
