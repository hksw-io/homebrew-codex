cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.10"
  sha256 arm:          "4b28638f87f7db76870056639a2965c911a780e3d7b9b36aae692f7659d68092",
         intel:        "0755ac62a35f6d5668d4e1a999a9553c71a1933c41030d96b901b636212f3a2f",
         arm64_linux:  "5269e060b93e6334534d24d578f452a4764db14694e58f32acc10e56a3d2d41c",
         x86_64_linux: "003e8ed5d5af6afcf01fb9c09a14fc1e27c35a7809725eda1b58711eaad92162"

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
