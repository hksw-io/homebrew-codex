cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.7"
  sha256 arm:          "97ca1b08943c69e749be0e74739fdbf7dfa8a7e5a11461fe9d93051d16cbccd7",
         intel:        "bf3b60c2c90c3e6f3ada12b25177a585a6ea95c90bdfebb73a2c53eca7a69e16",
         arm64_linux:  "8d356bd27062be576a75b10adadf9ff6f3ada2b25b2915ed26d36e6b850f7846",
         x86_64_linux: "e86ad1c3f4d97898199e6f21b77c1e73604779c26d410f20c8403df97f4f15ca"

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
