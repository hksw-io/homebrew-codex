cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.10"
  sha256 arm:          "f9575692871157910ec85bfff231b41ee3d03ff21e658268973de283001efc97",
         intel:        "61b9c2a43f056351d1ca1192685ed045f6dfefb7a9d6c3a69f2e82f423f7171c",
         arm64_linux:  "a7dfa2da6ad2c0b6994d36905e3239a42e64dc1bca3e40df1f9fab7b71163ca1",
         x86_64_linux: "9cacf334d077f71b044459aa116c5b6d2a495ea12accc98dc03160d4c5435781"

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
