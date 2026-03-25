cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.16"
  sha256 arm:          "6ba94215f460c0e2de93bdf1e0dbd551533f3c94375a462d2dbeeeaf55bcfa78",
         intel:        "5c2f1038dfdd24cab2b0db62c73943024ee87668446936a95a6377ece1b9091b",
         arm64_linux:  "6a8e949df36b499cebc00bc9bef930eb7c2031f4305de691881f1160c3f9ae91",
         x86_64_linux: "cfcbffe98e6dac731819aef34b3ebc2f40389802a45406433a1fcf7a4d5861ec"

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
