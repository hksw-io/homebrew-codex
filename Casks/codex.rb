cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.130.0-alpha.4"
  sha256 arm:          "56637d8aa1d6c1dbe1aaffa31846e9d0c68da5e1bf45bfb2c34e014d19561f00",
         intel:        "e9fbd35899dd2da67ec0b3bfa4bb800b9cedbbed57b09b9e5b0be60b2ef5463a",
         arm64_linux:  "531102b0e475f7f7a465de7da6e7c6416c8b424b27b1d7b1b087bb2c76dc01ed",
         x86_64_linux: "dcfad29ab3907a4c372778bc77fda1df31ba6a8a4d142e8f6406582da6451ed9"

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
