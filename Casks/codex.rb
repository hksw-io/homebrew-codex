cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.25"
  sha256 arm:          "586be7ca674df42c5a7b8d98347be51fc33183ab9075db4dbd3d04c47bf27729",
         intel:        "e8c2765ca29ae988e48a749ddd16a939467f6fd45dc3770aa157026ff9cfdd7f",
         arm64_linux:  "3a7ce2c28e5b4c3a9ca0d7c2579942bc85e00c764bd8f04a6e6ff068f69e1924",
         x86_64_linux: "e6bd4c5d74dde1a47ae5d4ff3916c1ea68c2404448a76b62fbcc7fa6730ee5a7"

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
