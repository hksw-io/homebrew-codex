cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.1"
  sha256 arm:          "75d5ed4c4a7ff911ea6acbcdd39dc9189b03ecc124c66d75c08811e8711660fe",
         intel:        "4aa3e944bd9accc4c0e16fa99537b54483d89048cf3c1e8c906878a49ff1fdfd",
         arm64_linux:  "223a866f149313ce4d54a3f640531da94dca49e534d74d0c227f8738a4cc1170",
         x86_64_linux: "19badc079f5b43c4fbab6e0ea69a356044adbfbb5e71c12b42ea412417c332c5"

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
