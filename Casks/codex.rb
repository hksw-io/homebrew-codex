cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.10"
  sha256 arm:          "d78f2d8db7693297c0d10a0de70bda5e80dc854372cb817aba73de263d6dde4a",
         intel:        "7f5abdee705795a1d34b7873674b25c046b017d20c7ce2b4bb49c7284733daf4",
         arm64_linux:  "9715dc4662cc45181facdca0f98518c6d79e729608717a79c382c6eb3b8482ef",
         x86_64_linux: "0f87f6a1fcd89afdef7d67b737bfb11126aa12df15e8ce4b9ac83988c5a50169"

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
