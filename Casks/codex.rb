cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.18"
  sha256 arm:          "5268edb2af87cd21c7ea4a003e01ed4be91d816707f7d62adcdff51ed0eca208",
         intel:        "a2af492b52564932647babeb579bf32cd275a9f233ba80c97374f997cd7712d9",
         arm64_linux:  "2f74ae0e55fecae4df14d332980e3ae1c8686a18672b67c564d0b3c74d1f7fed",
         x86_64_linux: "70d8e8bc8efca8ec04430bde4377b66ab7f9a06ecc18fd48d88cf7dabcdef196"

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
