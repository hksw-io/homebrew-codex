cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.1"
  sha256 arm:          "37dfeb9b6447f312b1be1ea306868d82eea80efc40239f982e2edf3cd740e557",
         intel:        "0b8f1844916114250e044aa8d128019b92856c6b64fd7b1dfdff22e784ad9233",
         arm64_linux:  "5b9c7a6ee147d3e889b3388ec6e7464a0afed5185c2468e5a666cc272ae7b6db",
         x86_64_linux: "d149ace452b3345d514cdd3843b60dc373afd2fef6798a18538d6bfb0aa48f3a"

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
