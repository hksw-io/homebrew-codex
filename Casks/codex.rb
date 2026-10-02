cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.9"
  sha256 arm:          "df2e04cb553e7081725cd53e8cc4a1a6f92716079c8191f823586b43ec29425b",
         intel:        "f61e905451f333d9f1fafbef26b9fcd27a2edf8a0b6f3806928d68fc78623ad8",
         arm64_linux:  "612e7a370b76edc3cd47c5babf4ef5272e4be20301efbe99f1f1871450e5d622",
         x86_64_linux: "974c435b445e5dc5456b9a39234ccc79a58acc92bfe2726f0088a6986730fb33"

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
