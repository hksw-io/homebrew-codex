cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.11"
  sha256 arm:          "2d5ec64ed62b1d1af72e53056f339c63c4572225a43a6774619b041de56782ee",
         intel:        "eb5ded36bdc6568d5156df72ec9595b5ca632c68b4dbea8451b8d84b03b72caa",
         arm64_linux:  "516be73f9662d25c0bf3f25812d7c46b38779e9046773714fe844b93b3ecb9a0",
         x86_64_linux: "50e21a97343a35f0854ae0dd415aa9bb4d4e2c877fdc12fa6ac2387fe61e9740"

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
