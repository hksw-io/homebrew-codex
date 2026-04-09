cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.25"
  sha256 arm:          "56fbdd1c4fbecc5034992b6bfdc1e2c9dd65817ac6c62a9bd4fee14a9d3bc8e7",
         intel:        "d36258c3c460190fdc917b38bc63b38f342a6c8ba978d71b1fec3ffbb5da6b22",
         arm64_linux:  "219df7c9d8b3680e5d0a0f5505c57938a2b7153794f3dc6a3d403ee016fbeac3",
         x86_64_linux: "2d42aa44b1621db2a6b7108eb4f99d200e4db0fa0ac903f8df4cbfe027fa60a6"

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
