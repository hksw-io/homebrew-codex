cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.167.0-alpha.2"
  sha256 arm:          "4f21b1a96854c6b96fa08a8fa0e9982b72148031ca080bb793e9e0f7295c85f0",
         intel:        "aa935e09ef461dcfe79a6b6eb268e690df65394e6c98b308b48a0f2c1405d1a2",
         arm64_linux:  "50b84c3093358b62446edfe2a9df3a5f2cb812615f4834247b3f5014d5834137",
         x86_64_linux: "9d82459b933247684da26fb1e016f0ac4fd79443bc759ece0c94edeec9786f2d"

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
