cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.132.0-alpha.1"
  sha256 arm:          "905bbc4d77285392561e9582cc40dbba1b219a9488a81a8de732af42d0393259",
         intel:        "97e65ad3a36a0cf77d35ffb3a5dc7814713b3d77b3ea8142a6c71bd58d4d2094",
         arm64_linux:  "f6cd4ae2b66b05721e33b210508b63311fca77994a687a24f1f9d253a806a88c",
         x86_64_linux: "bcccaa6ee11c896ea55a83295ae90ce94fba9ad8b0c870e71e7d9c9cc3dde7d5"

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
