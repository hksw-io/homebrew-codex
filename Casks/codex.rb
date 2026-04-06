cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.12"
  sha256 arm:          "ac849822a2d1960415472745ca7368bdd89c65c4035798efd80dee606ec6e86f",
         intel:        "bc7462ffbfc8ebfc48b7f9844bfdfb29add6f05b11d27e57bd3a6f3a8680a1af",
         arm64_linux:  "70b249efec52861d9d134c3b74170ee2ef74e57397eb957a7d3a48f8091e1fb5",
         x86_64_linux: "b4e91653599ca4335d895553c3f534a972d15a4d9e4bdde967ad87abc53ad741"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
