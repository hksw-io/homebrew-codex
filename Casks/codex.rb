cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.20"
  sha256 arm:          "d1f22f9c2a7f7dd1948b941eb08ce0a851f6368cac2e5b3f1b9b0060f5c39cd5",
         intel:        "99e2cf4f3909c890a9a702e2c8485d133fa0b58f962474ead9294519df498433",
         arm64_linux:  "99f6e1a7d0918c751e43887ff924fa02dd9ee5fd26d86f20848114f73efb795e",
         x86_64_linux: "72c2375a50ecddf26d0a77d5a374708c46cab0023173d9e9924cdcc293fbde1b"

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
