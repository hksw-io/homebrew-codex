cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.1"
  sha256 arm:          "3b472a618bd0e14e7c14e08d168bcaaeddb0a37efeac66c710238967d6dd4a0c",
         intel:        "67e0f1fff2a9f205f25cd965a8245458ec14ece49a6f4f9a12ef277148e912b5",
         arm64_linux:  "f2ecd52162c3582469a02682b518fe58eb1209e20018444d9d1161f49c00a6a7",
         x86_64_linux: "d562faf8fff06e3c6bd718952257d2c13b8035912097d3fae065d4451e528e7a"

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
