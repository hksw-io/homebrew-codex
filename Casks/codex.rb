cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.6"
  sha256 arm:          "3801ccbca8624041c7b784c2f87dae9335b5cf9bd3429dc7e79e8ce5feed63e9",
         intel:        "483e67a368c6292ab725f359b33718802da784e4ee00fa79fd0f97534e181bf2",
         arm64_linux:  "c126214b3f8f021f8d2d3ff08b0e05742997145882c7c9850648b7223d50d6f4",
         x86_64_linux: "a5f0b353e00742c6ca5019366a49e1d14bc1cb2a528e58a324f0fa01c7957672"

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
