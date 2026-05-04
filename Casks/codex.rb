cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.4"
  sha256 arm:          "7881b29c8f3164cda2fc98ba10b8f7d82d95cc47954a0d1ed98c73df7927df77",
         intel:        "59f0cf106d2af7300b4d65abb0dcc0aebfbc1b7e78533521b88f6f9e1eb741f6",
         arm64_linux:  "5bf7f8dcc5a47befb28d5bd732049d506d5a4f0f4be4b900e6005c0e551e0bd0",
         x86_64_linux: "0f230f89d5fe53fb5cb6756d38e0769f822dcc53e80732f6f94c869fea152126"

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
