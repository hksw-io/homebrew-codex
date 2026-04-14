cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.9"
  sha256 arm:          "735cafcd6213f7ab8ac99c58109b2ed4d066ab2230e08e47097dc0df3cd132cc",
         intel:        "66ffe1fdadfe63c6a33d813f7d0cd98951acf66faf407a61b7408674370dbf92",
         arm64_linux:  "e74ea0e005d237b79093e273eec309974a4685d750ab42a31b9e580d661ac9d9",
         x86_64_linux: "cdc56cdc3dc85bceabb9ebf0cbf28c0d50694dd8f5d0d2f348ea781706614b9d"

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
