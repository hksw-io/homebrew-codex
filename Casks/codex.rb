cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.2"
  sha256 arm:          "d025a77bcb01a639f6a9d0e1733fb3b83124a041e1a224d8f125126fc9850968",
         intel:        "a5df5be6ab7a06f8eaebfe02bff3bfdf1fb4b4c83e60adfb44b79ad4ecc363c0",
         arm64_linux:  "e6636bdd42685b5dd03f777325666f6001ac907b29ea63a5caed38d26671d308",
         x86_64_linux: "1a97d52c309ef709a39c7c7efae84ebf3ba5961d8fe43941b6b0f91130a5a409"

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
