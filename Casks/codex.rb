cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.16"
  sha256 arm:          "1b4348c3ad908101fcfa4f753fe70618ba969ae81e9fa368bfc1e1890f184a93",
         intel:        "f77d2d7f221400c994afe2fdf2542a254b58a5e5d0f6ef8471e1e5c53c34811f",
         arm64_linux:  "7801d11c042dfbc5227dc9a174be44a57c8341ef8fe174bcfce612fd1f1bc1ab",
         x86_64_linux: "0016cacc0b7e54b0aad6a43476941c98605928fc1da4622fe669ad00044dadc2"

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
