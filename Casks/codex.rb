cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.3"
  sha256 arm:          "a179caa88b2c8d9327d9e33de2005a78341cb4b254399729201c488bdcf9c1f2",
         intel:        "b418347cb8cacfa2a396ed14f16f73feb6d747f1bd60cd947e76996367d40d56",
         arm64_linux:  "21c2900fe894a80df6ffcad0ab8bbea0669c8bd19da726d18750f927660c22d4",
         x86_64_linux: "fcaf4b6ba0bb6bfe5dd671f1eb2b6bb4b1b60103ee8d5c688893ae5c3157364d"

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
