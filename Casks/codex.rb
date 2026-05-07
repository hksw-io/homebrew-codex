cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.14"
  sha256 arm:          "1dc001390ff7640a85086eb81aee0f06de919a959bb22596632311af0e578375",
         intel:        "7047532aec267495c57da6cd3b4e1bfb511b8cb56f89f72519d7ecbe381fa5e5",
         arm64_linux:  "c101504e51fe46255574dabb2c2c9aa617c170af6046e3c9640d8e4e45917547",
         x86_64_linux: "db79cde7c94c01c2748156829a8b2f458653e4d259a2d5032d84cd8464fe0e13"

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
