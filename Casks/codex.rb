cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.3"
  sha256 arm:          "ff87a088e938befbee9773725bb3ee8a68bd21f5eb1946f03a35bc832a975de8",
         intel:        "354ab2b19fbc4c7c3a07710f34a8563491a73685d411e30c47c987fd6a92d784",
         arm64_linux:  "559b3ea984fcc3471e5a056e36d783465d42f648b6b0c4a1d46aaa68dda1f7b7",
         x86_64_linux: "f25ccc251a86ba254385ee91a7716445eec3617e602d98efd801d604212303a8"

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
