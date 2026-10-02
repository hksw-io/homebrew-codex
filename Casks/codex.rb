cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.12"
  sha256 arm:          "e1264ec5af00b9667d84524690259b5bd37073b216c959dbe0841b6b98e53291",
         intel:        "b0d3748afaebd0ef22aff200afeca9f7d93137c34956ea2dc99c6809172ed7bb",
         arm64_linux:  "15d10fa881e084edc4a75057a0924737a84026c46dccb8a0feed93db1c02dc5a",
         x86_64_linux: "93e38f9b96335a36f197818716459307af23a9c751028ffb67c89fe18f0e5d37"

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
