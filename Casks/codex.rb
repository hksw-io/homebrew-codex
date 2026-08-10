cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.6"
  sha256 arm:          "4e10090e9b1aebd6482a1c308b2a79a5bf429508f604510d8e7a3b6a12003b18",
         intel:        "7940b4ce6141add4b219fc2d057455fa10b8af9d949dc76b573cacf398ca1e62",
         arm64_linux:  "6784d2473608b125e97f6528f0284d1cf4d0e672e93178f8db7dd66c43372041",
         x86_64_linux: "73a1f505e22f1e0d208fab5ecaea438ac9f43a6d8d7beb81119d818c4a31586a"

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
