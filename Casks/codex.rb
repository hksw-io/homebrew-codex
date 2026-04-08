cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.22"
  sha256 arm:          "3882c7e3fb194578370a0192825ec12fbeb058d2924c2f4727453d0bf58bd6dd",
         intel:        "15119a1f8d25a450de17533590031219928ceea81797fd7242d596800aaa7709",
         arm64_linux:  "7c052fcdc689b72484d5e157a013d605b526c3e175f050c37690d2766096469f",
         x86_64_linux: "1681a63ba77aaf4eb6c4b352dad17a259f5584d70c3295d74b5d9829b5831fdc"

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
