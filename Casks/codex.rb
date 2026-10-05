cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.14"
  sha256 arm:          "2398ab4e4a4ac84c8905fb5e7aa709f5c28a7e369845040eedd6c3e9df28f848",
         intel:        "76ca285c2ad97eca488c182be36e3fda829e2474d5dfee7862333a26882ee5bc",
         arm64_linux:  "5233fcee83c73bea8851e640a9f8259aeda368888332071002a00fa718458075",
         x86_64_linux: "7adc4033a7ea28862613e2c08db96bc08d5a9a0a88430f5ba9d721052b5a59aa"

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
