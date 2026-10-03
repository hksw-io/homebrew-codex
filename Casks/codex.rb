cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.9"
  sha256 arm:          "cad10bf6f2656d4dfd58c5b39ac99d021b4b6770dc227cb7db98ceb44fe2db8a",
         intel:        "29420e0f8f1639fabf00edd3a9b1b10368ba4a6a8c114254228a600f91749a38",
         arm64_linux:  "8ed9f1d0305340f3030252473d1ddfd4aa0c52eae5a393b7dcf8410dca2c50ef",
         x86_64_linux: "e7bca0ab04f75555abd6a2979a10fe9b7d3bdc91122e9aca99fd1d79afb859ce"

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
