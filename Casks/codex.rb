cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.2"
  sha256 arm:          "95d4b723f16b5ffedfb8dbb2c9c365017f072b53e252735444dacd4aac310218",
         intel:        "a42c1d6a1eca0ffec0c7de277111aa72f8186f5ec3773b0d6532618e10dacc6e",
         arm64_linux:  "ce56481185d48227ae37521f1b270275ef11420bc9d441a7eb9c183cadce8d99",
         x86_64_linux: "af398620d050c712e4afa63bfdf14cd48ee37f8c1ddbc4ac6180e1c5f73a0daa"

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
