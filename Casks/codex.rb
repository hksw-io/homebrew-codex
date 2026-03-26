cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.21"
  sha256 arm:          "7947ac66328ad5262666a640fa9a14b550351f42d6e44b2d63dbaa88613cc070",
         intel:        "3b56155862f84f054613add4c4d567cf59c46451652f3dd10707207c90405cae",
         arm64_linux:  "9263c9a6a667830e96707661dea77c3d9b85e690fc3bc88e79ec8a35292ad4e9",
         x86_64_linux: "d8d42612be9fea66b4d5d8d68bbe415c57b8b5342002d2bf83c1076fec8e6695"

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
