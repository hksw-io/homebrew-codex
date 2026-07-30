cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.2"
  sha256 arm:          "9420b2b53b390801a03e73c6a2404108281e48df69e871a7d238b00a1df70740",
         intel:        "0e0ab291b8a41a23a64b6aead9c54d8ec1d1f2c43c32aa3d8e6c130a3cf0e68a",
         arm64_linux:  "3e416c3455a48dbbf8e5eaf0d46ab255b1f738a3319c4b2a26ce16feb2f83a99",
         x86_64_linux: "5313c15133492ec1a349dc40272dd0d2a892048c62e2f6ca2d06cb7b76dbbe05"

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
