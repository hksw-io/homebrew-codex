cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.4"
  sha256 arm:          "d9c38f0204e453fb9e9f3c2557467939c9645e42e73bd53ab8eed5b5bc787ea5",
         intel:        "abce0f100bf6d5ffc59b39bf976aa4f1c0e5274bd5e676adeee4ba412ccdaa54",
         arm64_linux:  "bb69caa6b28efd90de320f069daf64e6d3d55571ff28941fd4a46da86546a9e1",
         x86_64_linux: "06745483b49f63bfb791996c7b2b7fe67feff46d803c5dacdab3199fa8074d8b"

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
