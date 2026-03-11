cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.1"
  sha256 arm:          "b3c388d564f0a82fca9e39586b792a7364fca9639038bf48815dc5f2bf586fd5",
         intel:        "0ba0d7d925d775883865d7d6aa31702c154415dfd7d8c42a65c8787b4f6700da",
         arm64_linux:  "9fb5c34d344cff3e1619294a49863ce82bad6098cfbb6161f6362cf10bcb842f",
         x86_64_linux: "a74417ca05ac3fbfb8b198ee05bb0e778a0f4ed95ac3f2d6f2054ca2f170ce51"

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
