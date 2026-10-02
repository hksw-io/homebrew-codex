cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.8"
  sha256 arm:          "cde5e0c19fa763b62a4ffa2ed095a5c9bf1e917911a8d3497481a214fc28a495",
         intel:        "2053eabe4702d59d30ddd9527e979d90974106bec347a427814ab6e17ee26ecc",
         arm64_linux:  "e19d3d83f0b275f6f5ffd3c2d91c4caff7adfae9096bb9d353e8e1aee29d0b29",
         x86_64_linux: "3c0293e6834a01b6f0b691e216653f0c850fce4f6f72e5df0db23a36cce4a326"

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
