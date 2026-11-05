cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.168.0-alpha.6"
  sha256 arm:          "7485a2b9eea55dbd5c039e4931124c856aaba3992351a89b6ea46b65f4274f78",
         intel:        "0c698e271f0096bcb05d8ffea03f2046b221fe0db2fcb99d0db5f208fc27b0ea",
         arm64_linux:  "7b81ba3056c3393393ba789b98c7a916ee265d52211a38b67b617bf8d19499b5",
         x86_64_linux: "6256e3bc154cfb493f93c9103454caf2587a91fff32faf18e124daeffb7826cc"

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
