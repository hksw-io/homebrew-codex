cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.22"
  sha256 arm:          "fba722699c344a76f3ada0638babdd17c3909161c5110faace81d215d1a16621",
         intel:        "ec78c52fe131055f1ed72536c8122663b057b2051cfc59fec593146621a9dce9",
         arm64_linux:  "0f13f366d3678723bef0336c9e6e8ddce7c039c1aadf33c80d43c2f15bf4e2e9",
         x86_64_linux: "be1f4b7a6b389cb03183f6de3797ca6d4e59ea344d140415ba6a2492543d3a1c"

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
