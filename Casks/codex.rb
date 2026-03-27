cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.118.0-alpha.3"
  sha256 arm:          "e33295a7daa9a81b8d86b12b4930c376dfc85584c5b52ddf9a0e669020e0f1ec",
         intel:        "d952ea6e55620eec24810b2c26c9775446156f0054fdeac1bf10ac77ea4902fe",
         arm64_linux:  "63a3d1b4c3cb932b78e8a01d4407b4af84e9164e8e822598264ffe5de1f5ab6d",
         x86_64_linux: "6215242de7e49794b902ec3c55145026d8d2245c2a024ad10d7ecfc15858c457"

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
