cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.5"
  sha256 arm:          "f665118cbfe301542ec4d7fab0a01a6af5a3d1b6e021852db93bc0a96949b1d6",
         intel:        "bc3d6dd5e547ef017ee59e3bf879c07896271835d00958c4199bf10c1969c898",
         arm64_linux:  "c43c8069fc0d0e39651afc38619d903d1db1f131ee5808ae962f2458f88612b1",
         x86_64_linux: "44250d53ec83dba177fd30675ec4a99cbac92b69a445aa6e1f0b2430d15dc0fe"

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
