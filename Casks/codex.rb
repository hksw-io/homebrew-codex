cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.8"
  sha256 arm:          "41ae1296e7988d2a389b74fa4345804f68af84605426535ee84709da8935c1a3",
         intel:        "584dfc126e1b8aac219ae2c420306f32e6623f4ec2f2800f8d953301f9da8dfb",
         arm64_linux:  "b59d5ecc1111603bb5dd317212ce66f545a1b7674cd45c8957e7a8644a8f603c",
         x86_64_linux: "7e0b827cc4a3f9ac7077cabffc01750b5a88fd3d398e8e5cd61b5a73fbb18b65"

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
