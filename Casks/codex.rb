cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.20"
  sha256 arm:          "412bcb38cfd50b92ac0dfc5cae49a970923ee57b9705862ee571d84ebf56c4ae",
         intel:        "b76ffb341f99813fc8ca1da29d943fcc764cb8505f57df6e39321da425e3713f",
         arm64_linux:  "03e8de7dc4b2cdc33f22a6692044e677126c22d3e4b60a929831297dbf236ef4",
         x86_64_linux: "a0e63bf6d596aab2d0e2ef0fc926050d51c6368fa8a5ca0c6bcbb2ad01135edd"

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
