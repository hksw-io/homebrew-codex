cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.13"
  sha256 arm:          "31da0b1bcb4a0ffee0d809c8c390d3079fd133b1ff22636f57e2b847b6f7376d",
         intel:        "020f3f94fda8e64086d37e53f5a9d18fb65059ff3daafd580c40f943fd3e7544",
         arm64_linux:  "d812e5fd4db765cf643b9cef0927eb34dd2b520fdf519884baaa3d766d060b64",
         x86_64_linux: "7aab1d5cbe4bffd8a9cb0b9a3bae7dcb99b51f502ce015ad32c1f957b049e43c"

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
