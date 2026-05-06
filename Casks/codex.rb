cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.9"
  sha256 arm:          "9caac0e350316ce708a13dc4eacdbdf22b63ebae8fe386e049fb7d5a3cff390a",
         intel:        "3dfddc9b389fd858f3c4a27d0248c09a693d54bab7ce8c1a2b58a1a018151ac6",
         arm64_linux:  "bbe180dcf83cd80b31b5bf08a76cfdbb853a64ce45ea693274f34adb168c896e",
         x86_64_linux: "f6f01eb30c9a902b27f84c68f97ade0156a71623880f73b8203e7ab47debb7ff"

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
