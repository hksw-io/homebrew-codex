cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.3"
  sha256 arm:          "8075b8a4d6d31f094042e72dc14efeaa858d4cbd66584e60357cd54c4dcb078d",
         intel:        "5e5be8c39076e45cb4cd6506e5285109535e1f1fde4d22bfe0f23b883e721328",
         arm64_linux:  "131ea9fdba6da017856c17d8f46f6bcdf21538ecb5cc3b1eee1a509a98ad4180",
         x86_64_linux: "e671a8ce0abbb670fe20737abcf0bbd29d9a6ab3a0043593c0bc620f1b0f4ae9"

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
