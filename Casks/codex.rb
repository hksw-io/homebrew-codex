cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.11"
  sha256 arm:          "826c9365e7e637cee001f38dfdfca46ff41714875b500fd9a6663f5c3f9a4d35",
         intel:        "44ea2ebc95c7a2e8b205aeaa34613cf6eeb9ea0cd137bd1dc0c234c5d47860b1",
         arm64_linux:  "5ebfa102ed8a5ac94f73aaef0262b6fb313f4c8c4862fe92a7bb2dd20cbdbef3",
         x86_64_linux: "a920da3eb26b6177e461ad1b9a2bdf6864648dcaa16c1665f7a9535452691084"

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
