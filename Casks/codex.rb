cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.169.0-alpha.2"
  sha256 arm:          "ce0d72df01f3a9b529be18944edc5555f2e9f0ee8c5e97ea34ed67c9a8303b46",
         intel:        "259f877aa8fd7f691f512bf8d481ae6e4701ea831bd345ca3320255aa6303781",
         arm64_linux:  "b213c3051e3f86e568a193c5a47cec6bb359c70ed6ad6afebe2ef498c776c680",
         x86_64_linux: "b4b6682f4f495093cfbd68c87ea88a4b9ca33d54b1f79b030f604aa7a088a6c7"

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
