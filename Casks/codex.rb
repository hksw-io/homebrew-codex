cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.28"
  sha256 arm:          "063fcf67aa65e6406d76cda96cca23f48f6b377ac0ad9a592d1963091f2bbf52",
         intel:        "6086f413e8660ded074d1a3b5298569ff19912687906c874ec950a3f1b37089b",
         arm64_linux:  "8d29072326bc79d1dd77c0240524d71849d5c67a2bf99ae5c30168b8f9a65095",
         x86_64_linux: "15293e0b20eafd5eb6a2d32184c62790c18e193531f1af19445b8ad0c325621b"

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
