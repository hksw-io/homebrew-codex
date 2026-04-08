cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.20"
  sha256 arm:          "f79b42382d2bdad32bf65ac0436747c972db6d22a6d8534d3082b8ce666c8d03",
         intel:        "fc47e1771392523afbddf699a2d686b82a2bb5994d153801f3c4c52939b530ed",
         arm64_linux:  "99ceac29876d4ffa3ef0897a6e8e63c6f8aad0422af56e40a31ad758c5a289e0",
         x86_64_linux: "6c3b7b17d0128a1569e611db248f7b258a58353a3b2e42b650280030c418bca4"

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
