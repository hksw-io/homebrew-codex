cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.8"
  sha256 arm:          "f3ad19598c1abb98bcef89b9f3c7afef160f341103435b60769857125f2f5fb1",
         intel:        "b3a627a43a8d16255481066bfe393e4147d5dd5b54bfa6dcfbe3b20b657d0a91",
         arm64_linux:  "36adb52c417e95f60d2b2cc853cba62d22dd93f0529d816d8dc2e7813b4df2f4",
         x86_64_linux: "610b859e41a5d29b2b79ca69fc37c0de963da09bb0261109d8b2dd672dce38ec"

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
