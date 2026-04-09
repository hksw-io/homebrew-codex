cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.29"
  sha256 arm:          "6b76e41820586ed3e5fc06dc645962d8f1a564bec1db74c26a4ca05fcf57ef82",
         intel:        "2240f0bfbaf606317b103a463fb365375c8a212d2d4e2480fb408b3102ce527b",
         arm64_linux:  "5fd3f9305a13b0afa6aa21df01c6ed92ade12798feef72683df649f558cbb002",
         x86_64_linux: "00dbf5534536f774f1524a25fc2673060c8386bf2019577e916878c6f31ea471"

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
