cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.9"
  sha256 arm:          "6ff4665c849b6270fac53221032ad72f68da1b2aebacb3cf4976a13197be9cfd",
         intel:        "355c1fb990dc9a7b12185cab5848961f28c34f5cad3f5532e186122419028c8d",
         arm64_linux:  "d52d181105f904956e6e4afa66f4bcc4e213fa58ab494cd6273728fe5a4a0405",
         x86_64_linux: "75871e11e917f4e422cfa8c78609846fd8b7fd8605bbc73eed98f7853a4f3c5b"

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
