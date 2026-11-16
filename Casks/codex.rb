cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.8"
  sha256 arm:          "73f37c0536240d351165dab25c80ed1e0b1d7968730e59df46df7ca8c05ca6a1",
         intel:        "57035a6627cc742c950e2d33a9d37d356cbd51f41a6d9982a1252e86055f1645",
         arm64_linux:  "5b23ead00678d2102c24b79b53a7630941fed7a22f43d198eb906804d251335d",
         x86_64_linux: "5882d17d28a1c189d0ee67be2ddc8c6d465df0ae2f85a14149ec1b9f2b7c85ed"

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
