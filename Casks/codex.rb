cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.168.0-alpha.7"
  sha256 arm:          "7e8bb78b52042c9bf01eee6dfcca4914fab8d419d13ae5e86ea94e0205dd9c90",
         intel:        "c244ac45a8911c4ad611eacc46ea8ee0d793a6b94bdf7c1df7588313f8d60ccc",
         arm64_linux:  "384ecab6d467bdddfa046910779f2de36a4c47a4aa07ece16a01a1168bf333c7",
         x86_64_linux: "09f65494eeb7625cd5a48a98844e30b2c7f72eaa447ff98fc06f7274eb5055a9"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-[0-9a-z-]+(?:\.[0-9a-z-]+)*)?(?:\+[0-9a-z-]+(?:\.[0-9a-z-]+)*)?)$/i)
    strategy :github_releases
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
