cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.2"
  sha256 arm:          "71b267747b30cd8dd13ce8c38860d05703b53ebd85a43d93c1bf7b58714a753e",
         intel:        "c1a051e1c11ef0a14501df0b8d828401edec7304a02bca70788db918192f3e79",
         arm64_linux:  "c21048ec3b44d8f657bb0ea29a120534b2d3c787b709c3153aeff9d5d6257bf8",
         x86_64_linux: "e2388b44a7fd61459eb937ed885b9abb39ebc5ac2c69d9b4d33279a66a06fdc8"

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
