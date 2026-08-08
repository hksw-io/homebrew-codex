cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.5"
  sha256 arm:          "abeff7ebe616e3b11a27acb7ee3b2604229a69837807f218a8ad5b5139816dd0",
         intel:        "26abfb028ec84aa51600872c9627d7dab08f34d5c9aa8fd1e54288f5cbad4195",
         arm64_linux:  "07807c13c587bb4e17018db483ce99d89b3c2cd5ed7a595490e39df2f2a5829a",
         x86_64_linux: "fa0edc36a35599e953bd305fb245bff62bb0b00e236638b658688d37ea14896e"

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
