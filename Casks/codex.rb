cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.10"
  sha256 arm:          "7ca9e0f3adf5b141f3d1c64189c9bff668af749426df0cd29fdb6458be4fa58a",
         intel:        "866eb33710702d54769dbbb587075c0a749be475078904741d26af9613fe7a06",
         arm64_linux:  "987e1d1fa607e974447869a94b263b5956cab85faa9befb35be488644938dbf6",
         x86_64_linux: "ad21e133789e61e3cf9130bf2620567ae3465c831c701943b759244427c5d7d4"

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
