cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.16"
  sha256 arm:          "e5f0de5ec85887b282d82c4337925c48028d0797f52fa369304c6b66fcbec58d",
         intel:        "184c5b2e57501df3d3b0506214caae403afdcb2dde948f4bd5d3b1835906dcc2",
         arm64_linux:  "2d5f6e9a0971ad94bbedc46cca92d8a608b2efe7d6f14ffcb0ec00d803fa6808",
         x86_64_linux: "63e02ac7e30e40b184d2a4e0b745218a83134120ced303741fb00b4142568bd2"

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
