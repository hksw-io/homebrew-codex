cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.10"
  sha256 arm:          "18ac8e05a7925fc0624323f9649d432f83bc19d9a6d9b94c136ae3282a192ca0",
         intel:        "cbc228e272542f507cc49d5d7970ea9d68ae1a288a6ca246df96feccefc916db",
         arm64_linux:  "83eaa7d95dd4d5f43cce22bccfb8959ef4b93a0e549c2c99cda52470674372d4",
         x86_64_linux: "ea4af2bdfba1cafc79d20324840099e3d40d2780cc15e289bd1bc84cb4829640"

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
