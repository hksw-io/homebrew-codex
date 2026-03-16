cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.27"
  sha256 arm:          "82dcb865ed7cf2ed9896d0b1eff28b1b46bba161737fe6db99874a66268f7ce6",
         intel:        "82567ddb712a1a363a5bdf474dd0851b6032d2799ee9b3ff49273f0bc06825e3",
         arm64_linux:  "a28c2e8739be16f30307b8136e92ed4fadd6276b973da29113cb0eae15c41c91",
         x86_64_linux: "b5d76bb0fb6bacc0874dc9cc2d1656c6116bab383d8b589c510752f371f1b2d7"

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
