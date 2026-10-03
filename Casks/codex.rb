cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.11"
  sha256 arm:          "dcc782785c0922f4a1bfe442ab261210502e4e763948a8d43553b589276910ab",
         intel:        "aa17c3f470b5d5f08ab11af2948705f6d620234091d03e21a346be9138c75363",
         arm64_linux:  "d19f08288bd5272caaaf402b58a47fa08162ff6ad7a8177639bfcc0c3073ed40",
         x86_64_linux: "69ab008888178af433818046760a720deaf29b01c9e62f56227b123e3dfed463"

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
