cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.114.0-alpha.1"
  sha256 arm:          "5c854039755ea3e19f5ec5abdbdb4a9cbb0e4fcb87c1bf14f1dae744564d74ad",
         intel:        "d78b2d1a613fb63c30589e7ab4edb76ad21de0b7ce3b887c3673c33838641309",
         arm64_linux:  "71f2abc29f47a07629324729694a6b7f9da32d20b9ceec1e4d1f26cfbcaad7d6",
         x86_64_linux: "2bef4da865a6673c6fe8ae280435066199b02687642357bfa681bbcb5430ebb4"

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
