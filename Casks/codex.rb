cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.15"
  sha256 arm:          "d20476e669251a54f2b6ae802df6bd607e06deac6049ae64110746fc06c10de6",
         intel:        "2c971dc367aa895688d2e0d07eee6f7b34f07072661dc0428f187e29179794b2",
         arm64_linux:  "46a7d54ddc74020ed2b6606e39d81f363a3ce81af03c3d61a4905d3a566822a5",
         x86_64_linux: "9f00ca8617511b13b26fce88b1241ac63a922557d857e5d48b4e41fdd2cc1bf8"

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
