cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.12"
  sha256 arm:          "d5755ffecef46f709156480eb1b81f0a406b99468181a65abff9d269f3eb51b1",
         intel:        "45e3e5ec70c1b81df4bcea45b4cccc09d1c2bd2c1b533b1a80eb679d0e4bbd4e",
         arm64_linux:  "250150b11b29c775c1d070e6cd18fb2043931144b0e31a7a714747a1cbb99d3f",
         x86_64_linux: "91c4ce046e3b6b20934ef584d2d76c9671ad63f6c1de5fc640044bc15ac0c7cb"

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
