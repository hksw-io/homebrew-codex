cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.12"
  sha256 arm:          "e1e5a14caef71524a539a04df3a5bc609eb5083f1185114d251d0e218bc589cf",
         intel:        "24e201c31a75590c4c774a5ae8fe58d685c6191116bf75bbc1967c97186f008a",
         arm64_linux:  "1a46c96d0efa6fbb6861c30d4e5465762e7e3cf96b97c08c6c307ebadf1fcbed",
         x86_64_linux: "c447933a54ff4f837d9414e07d92f8c9aabe7f86b0f876b3e9fffe3cd235b4e5"

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
