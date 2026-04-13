cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.6"
  sha256 arm:          "d8267d829889cc4d4007b57857ef5e3aa9f6daeb4d328a51537a921438089426",
         intel:        "02263e11baf83996933f10d6651d0578237a56b94a12942b7f58c31fa6de8902",
         arm64_linux:  "39fcad21b451928d994156f48ae352811abcd318227405d9dc9110399c623add",
         x86_64_linux: "4a7b9d672d876c5861718a45492f65f8b997c40a1343b20a4e86f761d1299867"

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
