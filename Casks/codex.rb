cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.5"
  sha256 arm:          "0ed89bc78992367f64d37b53f6184fd9d441199a0e8cd05604d3309dcad3aa25",
         intel:        "41cfc19139176b1ed15cf6adc9cd5eb352812f7a7b4301692d3a77c2e113e2f1",
         arm64_linux:  "0add3e08330c0589198d36ee04d12c9ae982abf823bda7e6e71419f5a8091430",
         x86_64_linux: "2c7c3bc6cc75a0f467933966735c4fbf49167b372a16f0e54fef151d13da04c7"

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
