cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.6"
  sha256 arm:          "447c8bd840a80d7d3810dd023e1d58a90e7b88f602e72581d2802f5ff0559eb0",
         intel:        "fc84864d21fbc75c42f6fd2d2e34c93055e29d7a99005eaed5c249132e253f43",
         arm64_linux:  "368a3a552e276c73ed133e68973235f835513cd4bb86e57ceadec7d120264d51",
         x86_64_linux: "a03ead6736d9196a2756246b172c8e4ac6a315ffd463731a1856df42af1a2c6a"

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
