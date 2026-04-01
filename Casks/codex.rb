cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.2"
  sha256 arm:          "e07ac87b7371465370380042a4ec7a16a5dd5402a871755dba281061d4395443",
         intel:        "b7b533ccd69783f2c5b16c55ed842c84cb1c96ce13907a177cfe31a5bd4b6015",
         arm64_linux:  "9dcaacbe02092e7a99d237ed708f8413df372c5b58f0944bc6e28cb27eec71a2",
         x86_64_linux: "812ed19edfda21a0a05b0185e0750809c4cb2a7876ebeea3786a61fa6c4b6702"

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
