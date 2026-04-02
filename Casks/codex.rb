cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.4"
  sha256 arm:          "90b3dffe8dcba8b7967c10c5ee484370fca3ef42264e160f58466444cd2d14c4",
         intel:        "6ea249b174a148bc0e3060592514ce662e98aea8ebf55260ffcc0832f7fc96d3",
         arm64_linux:  "55b79f10834174fe523ba6675bd3641c53bc5f95d40d8ceceec10cf9baf811c6",
         x86_64_linux: "3a5d6acfb84426f75131a04e47e236db7559d05071098a21b2c2ea06e5d941bd"

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
