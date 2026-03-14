cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.24"
  sha256 arm:          "57df74f5a9635e413a906ec292c86dc1f56e4e173bb95c6e741135ccf96a5f1b",
         intel:        "f5d52554c2d8a8456d00e3b8402e23a5f2c4fe3be491c55710bb16e618e69043",
         arm64_linux:  "dbe4e19196a1e175bb91a5248676f36f5c6a44aa5ecf7db220748176a85380cb",
         x86_64_linux: "bde0e1f6137830d7f1561ed1ac7754c59c36e22763b7a36f10e27c0d591122c1"

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
