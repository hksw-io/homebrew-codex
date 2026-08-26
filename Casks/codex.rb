cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.3"
  sha256 arm:          "f21c15275746869b4349b3a61acb5df6f05f6d3b0926e79ad01401c57f82716c",
         intel:        "ab965c133625760f03ad9d09b92a72b7140d03df6558c04b92bcee473ae2fb0c",
         arm64_linux:  "10880eaadc9bde5b39d0e367b93452adae40208c4997fbbf3caba1da61292eb5",
         x86_64_linux: "94e753ce3a39e114272f9007a265a95b0163a755f94617dd7dbc82a781249810"

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
