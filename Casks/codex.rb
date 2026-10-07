cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.18"
  sha256 arm:          "64e26db2c882262b1be33f7cb5ae0f5bb21f879b71aeed27f94d905ece5c8ee6",
         intel:        "1e0e82895926eb55686771111f1eb0e70953c96897d78879404ba054acc340e3",
         arm64_linux:  "698e32508f7d2dd55e26efb6126afa0bce88274656dc411e2741fa49bcc59e93",
         x86_64_linux: "e66429dd12df16866b66e63c02f7ed8d809c0ac5f70756f9d4df5839d7c99eb5"

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
