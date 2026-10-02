cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.11"
  sha256 arm:          "127eb29ba44c21fa3e049a7ab19251b314c5272d7673690b76ad8c6ad298398c",
         intel:        "0b44b1b74d5c103d5a08bbd6636d0148319d937c07f372eaf65cd8e8e56bd046",
         arm64_linux:  "e57abdfecb54f847d49b105dcfa4417105ccca48baf10e1f91ba832b8d72a776",
         x86_64_linux: "3db931335dc372fbba5935dc852ca9dff8165952d0345dfddf052d571d363dfb"

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
