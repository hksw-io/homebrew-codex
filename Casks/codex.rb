cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.6"
  sha256 arm:          "c15ebc3e9c972babef389b8ba87a3247761afaf10366b4b5ba9cc681232de1f1",
         intel:        "62d262f9fcb7b113e95e431bbf26337fbeb69fbd02cd082a24296946e7b768ed",
         arm64_linux:  "b0b0338ee2c1f917fead53873056a41d927fbb10e953e54cad0ae23902fe4c88",
         x86_64_linux: "a6b6f1efb1d7fa0f8bbbf27c8d32d9944019a65ea5354f616d56e64696496075"

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
