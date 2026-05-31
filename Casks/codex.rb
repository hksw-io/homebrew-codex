cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.21"
  sha256 arm:          "56d313d3cc7d2e0b37ab2acac19a2cc120517cd45e0995ccd6b4e1357a46a7c9",
         intel:        "9cd7293581660f344caf2871490032f6370e47e209efdc74dacfe353f0dbecf4",
         arm64_linux:  "28a254052a050431a45e49590baf9c07545cfb03d092d0bf2d0f8d99c6a0c826",
         x86_64_linux: "efdfdbaa351ab270b1d64c56a8a77231d626fb19aa9429cc326b590c76c5f2cb"

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
