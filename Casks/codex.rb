cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.1"
  sha256 arm:          "5674f5fd7e1458a8546d822e628950e63612ac1d81ddaaf6db0b89350a4cdb3a",
         intel:        "a004a9138f758431059ee95e197ca33112e05eeda5120eb09a97905e33d924f5",
         arm64_linux:  "4d84e82602028b59956157ba7eae7fdffae18e0af0c65ce9d3ef787b94ca3b4d",
         x86_64_linux: "55d10f8e40cb6d5dee528413abdd531a480efce7cdc3005c98174371d0522d4f"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-[0-9a-z-]+(?:\.[0-9a-z-]+)*)?(?:\+[0-9a-z-]+(?:\.[0-9a-z-]+)*)?)$/i)
    strategy :github_releases
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
