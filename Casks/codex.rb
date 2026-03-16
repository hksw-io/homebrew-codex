cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.25"
  sha256 arm:          "7f268000d95e7ce1573c22af98df61c3e668faf4e7ea499e2dbede3608fca055",
         intel:        "742c151352bbfeb292f0a43f74ceaa7297d883a73109750362715f9717c6e40c",
         arm64_linux:  "0a032f120dddd400eac50a1d9d0d9ebe451184975e86f7355dd4c4820aaf28dc",
         x86_64_linux: "b998df3f21fcc21d9499da6eb0bf1ad8c24d9c29849e1fcd54104c6b4b159182"

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
