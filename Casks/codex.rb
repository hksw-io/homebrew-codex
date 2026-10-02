cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.4"
  sha256 arm:          "6e572811e85152abb45f575d405b736c7b88505587866ff65860723650e4aaee",
         intel:        "cdcae42eee61c294983e943713d2430803dff02627edbc2551d4eb06c5231168",
         arm64_linux:  "eb75033a2faa7c68170754f602e5bb90d9f7e4c30bdf0f3c9348f9050977eb15",
         x86_64_linux: "59b5bdb1e09da3274599d619ed02b54ddbffee8e98b80f51ce0bc96caf48f5c5"

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
