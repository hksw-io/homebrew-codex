cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.9"
  sha256 arm:          "7905a98df57609250c3b7d09b029f7cc89d591cb616eb8b999f5d5b9e7eb9caa",
         intel:        "c9f02a2c06cd7eac09cf540de963f87684b5038487b6f076efb6d095dbc87fac",
         arm64_linux:  "9ae5e3c32d82e8ded156a95b91cc3891569dc150e1188cce9ee1abdd4d79e065",
         x86_64_linux: "16a8985d2f1ae9b658cf3b4368f61baa7414274cf5ed8d463bfc4c090cc4d177"

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
