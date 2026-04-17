cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.8"
  sha256 arm:          "e3c39d45131772f35fe36ea7d739fb8715f56f1b8feefa342256d8ee69243029",
         intel:        "3ed7653416446980a6cad1f9276b93e6311d843b875d84f215a1817dedbe3f96",
         arm64_linux:  "bfaee0d7461632d9c12e06ff0b1958d9d97863618f1dc09a9547b3f73d24ef16",
         x86_64_linux: "38d2c82010b35c133308c50fd4cf911933011dca172ada8e122e9f3fb0fcc612"

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
