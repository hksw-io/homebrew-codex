cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.11"
  sha256 arm:          "bb0d8472c64073b2c88b28f995c1d98c89f85433429cf570b76546b4af024f64",
         intel:        "36eed18400ab430232e8126a069a7c527072c011cee5dcf0203b288e93b24453",
         arm64_linux:  "1ff0348044ab923c61b96f74e868d1cf873d006105fdfffdfe348c0f428d5450",
         x86_64_linux: "e6eb8cc652265e219bd5d08bc65fa1a204d51e8cca38ac52304bb4456efe4f70"

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
