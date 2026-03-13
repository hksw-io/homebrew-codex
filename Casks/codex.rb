cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.17"
  sha256 arm:          "8425c2541190f1635fd02777e10f07d84b6eacfcb0e3146c8d5b829a70139506",
         intel:        "3507f228fb5844e1df024a5fb5b88a858cf9746c5d0b3585b4340f9b53b2be5e",
         arm64_linux:  "37b1046262d9852d6bd8a4eb11d9e55b73f410abd521b920ce4092d7a1088fa7",
         x86_64_linux: "b3e8585bf520c3679dab3b74975957b6b1b8e6891c249b8eb5139a07ecce5c6e"

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
