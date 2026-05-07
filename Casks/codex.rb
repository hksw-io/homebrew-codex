cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.130.0-alpha.1"
  sha256 arm:          "f846e15293883a1fac8f9387ead56db472333b7a709b330776d85787c15662cd",
         intel:        "d9de9c82421a64bbff9a628db2bfcbbcc95660822b4733ca6953632976a6dc1d",
         arm64_linux:  "d18030852d111e9a9d70fb75303f44de300a2cc307988f1c68faeb9132d9aa24",
         x86_64_linux: "46cd6aeb7b01a4b53e4f0721f4cfc9660e356f5e2991c99fba9b42253c01558e"

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
