cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.6"
  sha256 arm:          "d5fd7c3496210da5836a27aa71af137b5a097fd0f6343af2eaf9b7066d9ac603",
         intel:        "e5a294a79a0a0dc19dd7c80b8ad12f0219ce9352f994ac62806919b4f40722a1",
         arm64_linux:  "fb7232f4cb819dcab42fbf3a7c5ea34a18439ba6487ad625d97e6abf540de03e",
         x86_64_linux: "a1bdb3c6f2e93514b87bbd2cf2a2681fa3972011f99fc31ed746c85535eb9493"

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
