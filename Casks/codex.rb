cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.166.0-alpha.1"
  sha256 arm:          "23fd7a7c1c874331fe72928eae25739727026b91824dbd57361ea013c0a8a90b",
         intel:        "e0003f02632dfeb14dc010310ba2d1fbfe2dfb51a3b15be8be4bb1232878e69c",
         arm64_linux:  "837413cca4aa4792b9f91990f9999c2e0405f4d6c6cff1f6669de58c78de4e20",
         x86_64_linux: "098f2c6ada6fddb5109f19787fa53e82415feb061ec9127499defc661c540e42"

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
