cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.2"
  sha256 arm:          "e411c3cc164bf2534a20ae35a6b7c441aebec60a1241a66c577836e834d901ab",
         intel:        "9e7bd50d77cdef8c5bf2c87c1a70bedb52d1fc9309642009bc3c3e1272511a16",
         arm64_linux:  "d8352803af827ce3c08b3af15ae693363fd98f7892b0651bb55197ca4e962933",
         x86_64_linux: "5802c5ee063aa337e17799c8a04f4583628850d0e912621b3f8011f47a8bd8e4"

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
