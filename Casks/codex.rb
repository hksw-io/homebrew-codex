cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.3"
  sha256 arm:          "e4913b5154f12bad25cd9b9bdd7d498b049c578d5762065266d8130a1ec25d2f",
         intel:        "11cc4c8a621392e1413dbc06b5bb3a337e45d63cae1d7159a87cbaf83ca2a1ee",
         arm64_linux:  "a3e59987403ec1704c841a50a286ee658ec77370c4691fb46dcb2c3d5d76f0fe",
         x86_64_linux: "1a69cfa081a4174c5af11d12526bb1fe64d3357fd2e0c03db46ce3f00fbc66c4"

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
