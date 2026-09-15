cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.3"
  sha256 arm:          "0ab7ea54e6a4433369cdfbc397dee4e7d613c898f600485dbeefa99ba66fbdb0",
         intel:        "a75a8a09c446fb6d0a1aa8e8171e5f75c6ea5aafce884879125d0e4cc16830eb",
         arm64_linux:  "b1e71fe1dcd06b8f5bb75de54dbe81e8cf83165af8c6de2779884a5cc00f279e",
         x86_64_linux: "779032d66b023ce129341cfee533f9bf8d4fad2fcf2a6357f22d64c00d16f4e3"

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
