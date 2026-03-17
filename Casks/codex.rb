cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.2"
  sha256 arm:          "d685fcdbc0645f9b8b0027f97d1b7fcdb1bfc2f577929581f9f43b1730c2861e",
         intel:        "a661d1fb68bd6143079626cc7d05c3378105fe0fe71a9cc5418623a4022cea74",
         arm64_linux:  "075c373ffc686b22e14d358a2c3b063f3163f62eb37f2f9cb005b448c0eca7c1",
         x86_64_linux: "b0b148a3424a9e7794a7f6035b683fb413eef0659060e7b1399eb7e6f167eea6"

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
