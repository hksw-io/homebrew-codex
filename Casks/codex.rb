cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.10"
  sha256 arm:          "dd9f41723ddc7e90a4fdfb0b447171e8262eabeb7e5e98a2466630ee0ae764f8",
         intel:        "e8114858f6e5743e0aee5c0bc0cbd5704b1254fa28bce9dc2e7e7f0e6eb61e00",
         arm64_linux:  "6b8950d4691c295148ad2950d3a37417bdb73f04ef2389d2f3747fc84f862ade",
         x86_64_linux: "b79761979327c6578bc1bd652e0b8be8a58195f862d225817feb0769585f2555"

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
