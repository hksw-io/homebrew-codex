cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.4"
  sha256 arm:          "fe635d88f5417bc9135de2506aed7e8005d6c8225959e8af8db7e984c8da4df3",
         intel:        "fb82b97cb87687ed5716197c8b00f84475172a5c23d93cf3349484522efd9cd4",
         arm64_linux:  "61690e4e8b74cbb6dc0e75760cb2ac8942041dac1fd0c50b07d3340734ee307d",
         x86_64_linux: "75e586fdfa90a09c69779614918b11641817410a49a999fc65a0e60dff5b2de7"

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
