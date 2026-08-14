cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.17"
  sha256 arm:          "60883026fd9d39f77d3b0a879debf05a6a1e8e24254b209aab9665655564398a",
         intel:        "939d285c6e7dd6ca593c771fd3402fd298d511ee12fbdcade9478c831ec368e1",
         arm64_linux:  "fd32d4a057f06391c7fa0b9ee495cb9fbccdddd7d063cffb13d2ddd6724cd882",
         x86_64_linux: "e812cbccaa97980895517c698f242ded53fbfa694e4e6250bd26876d1e055014"

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
