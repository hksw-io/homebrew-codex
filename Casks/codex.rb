cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.5"
  sha256 arm:          "13b2cf099f270c05b53bfc4db5d8740df49468423a27a08d9a8f5dbb645a05cb",
         intel:        "705834a9c230a45a290c7f876c2e3da4a76f871a6bffe98155b31eeb800f72e8",
         arm64_linux:  "e1c9044a7b828ddb1a7df89f38d7b624f6509850d9a0b9780e180e072a5d534a",
         x86_64_linux: "4ad75be284f3cd090dd91776e04571f21c6f7eb5d5cfa83725c78d77ba4a3772"

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
