cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.6"
  sha256 arm:          "399d2a2f3703e9513cbb5b493c23bfe397e09e50017f8afcdeba9beb76bb6ada",
         intel:        "89873861fd5a7cb1df97daaf03f2ebf9dd53789eed5449658fe7650f2fbd32a9",
         arm64_linux:  "13fbbaf3abbafd106fd2b6e3bdc1c5dd2051bc8f5ed6bbf03c57599248ee416d",
         x86_64_linux: "65dd86e2bd704ea1026f2640ff6746511ddb60fad025a302e09170759d65de23"

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
