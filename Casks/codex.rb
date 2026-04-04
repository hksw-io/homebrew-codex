cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.11"
  sha256 arm:          "8de444a24d3eb929273beb8acad57a95e299e7b62f92c9b23ceb81e4fbbdbf27",
         intel:        "dc76393a1e2c8e22b5bd76c4e967585265ce0e0bd27ed8a8be4d04d9b8fd95d3",
         arm64_linux:  "53066738c2e67a0617a241c55b37f4a0139057579e898656689e3eb16fdd676c",
         x86_64_linux: "d26683bc3da1e54f5af2e4ff792d2054e9c911678a4c171e950c3d4b1ee8e977"

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
