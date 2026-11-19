cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.172.0-alpha.2"
  sha256 arm:          "f1337ee83cfcd1c5cac279887a9674fdc8bdba96ad83ceb1c70de45b4754b671",
         intel:        "5819ed014fb4cbbd55113afbff000b08d8a1db86f61cd41cafedeec2d2167e4d",
         arm64_linux:  "61adae5d360ab5fdd2328bba61bf5103d0ff594e3b02bce7e758083c166ed2a8",
         x86_64_linux: "cd756626f89bf80521807c40d543d0b6953fde556195ff115e1b0d08c3df6150"

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
