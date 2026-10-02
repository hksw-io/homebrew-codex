cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.9"
  sha256 arm:          "de3e354794c74105147c3a30721f12d80bfec0289f6af3e080a1d967b04b0c96",
         intel:        "a5bb5d5ed46e55896e6ac3544cf84e1cbf2d140ea32cb5ec7ef18b2880a018f0",
         arm64_linux:  "81617ad7b23f3c4774a060a203fdb445a2a352de10e5401e44416938fd8cc8b8",
         x86_64_linux: "21b2d1e50c04b3114a8001e2afeabd56150b68476e66cfbb76255cd8b5d0039d"

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
