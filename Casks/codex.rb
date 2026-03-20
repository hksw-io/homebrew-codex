cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.5"
  sha256 arm:          "fb9c0d218e56c3a25b897df442ab007339d8f326a157188f287e633f451e377a",
         intel:        "b4222d2c087216a4649b4e7d8bbe0db2804c1d065252b5116e79a50d1346dbaa",
         arm64_linux:  "3547673f8ce33c394f6f0d041cd9d6afb0240e433f4d3a7990b119413b168db8",
         x86_64_linux: "9a1d20ea0a847937b9b2be85e9213dd80b8ee7660c22a0be33e7cbe69d38b500"

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
