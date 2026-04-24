cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.1"
  sha256 arm:          "62788aeae0715b1eab4cffc41b37c11ca0c75507f3dedb55eac9b92555ada43e",
         intel:        "95595e03c8ec4f34a5d25f1c49aa6911cea51f9cbba33837c52de602a01da004",
         arm64_linux:  "658064efa173666a72e652111f92ab24626740b3e709bce2240445d4dedce5ef",
         x86_64_linux: "edc35320e744fac0d5cdd95ece3c15a83b94512c3478b66bfe1a3d821c735c1f"

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
