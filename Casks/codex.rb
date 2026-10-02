cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.7"
  sha256 arm:          "a8a50c41a35bbba96591dea093149452683fb2e5212b5333ad289cb12f0bc9f2",
         intel:        "5a9917e704104c4b867266d7d096a2c27051d972ea39ecf3d64c13e38495fb3b",
         arm64_linux:  "967cb8a1c918d5e33bad143f5effbbc8a3cc7b6f258cd2c3b60e5b5d72154bd7",
         x86_64_linux: "48c3788b5922eeebd38fbf410bc2ed66290bea271daf768f4d4d25b1f957c7e4"

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
