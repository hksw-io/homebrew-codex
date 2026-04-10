cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.33"
  sha256 arm:          "4d34ca9adee865436a4bc705b1f446f0c9381ccec3132a190b2e2a0d93b18a12",
         intel:        "608b2edf1fe5b79d33dfa355594c5d4606f27ebe2db80010a8ce23dc6c34a0b3",
         arm64_linux:  "e9e748856a14bb3f4f56e01d052c0a6877614c39a3cf659a51bf39c9beb858b2",
         x86_64_linux: "870470c158958bd27825922eb618c6030d387784bf998dada12f6628d6ccbe60"

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
