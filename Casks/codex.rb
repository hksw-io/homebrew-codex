cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.5"
  sha256 arm:          "a760b2b2438109216fae3d0d9d0cd0cebf6cc94fc53e12975ea9dd2549bade78",
         intel:        "7c2b6a0d56155215878e9b2cf467bfe7cd7a907f0f8f42d2b96a80d68dadd363",
         arm64_linux:  "72cb631dc9a5bb92ed3d5724e0533a1b60cc74a076c9814dd41e8bcc595f0a79",
         x86_64_linux: "de234635abccd0fed32a266ceb1bfb8862d562c0c710e5e8c0be17a2b2d8a482"

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
