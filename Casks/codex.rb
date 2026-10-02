cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.1"
  sha256 arm:          "714098a314dc0efec1e75d2cc3e6de88cbb70f566c5c9f7c59d6121a314a2002",
         intel:        "75d1179b230242c77509067f259aaa81638fc9f5bab18c980059c581903ed999",
         arm64_linux:  "51f0b2d39bdff1a090870f09336614ac06a1e11f4741d6caa015d2e5d41c3a0a",
         x86_64_linux: "ef718f4553a13f1155ba3d6386ec0867ff63d4e05dc1de9965843cb43c19eb0a"

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
