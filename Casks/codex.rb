cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.3.8"
  sha256 arm:          "d7670d0bf36e5def1dd80dbf97e1cc2ab29d736aaa3979377abedbfc7e185454",
         intel:        "92b8228088cdc25e80211278651ad1619200f4f60e2a917c8803b2234171932a",
         arm64_linux:  "695fb3282a4b70d4be976316b9c92a4f45db11d0b7e19930b3c3986f183b8f01",
         x86_64_linux: "ad221845e58fa1b82065e2ef4180aaa11dbb8492fea8db328861c162b3b25ef5"

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
