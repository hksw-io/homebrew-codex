cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.3"
  sha256 arm:          "cb3a4177b725355659a590f997e4151684d8b3bf7e69cb9308cab79c75e80c19",
         intel:        "586393ef0f6acc01ed45f7069810e58939fe420e0a7b8db0b242aaa166132086",
         arm64_linux:  "afb2906a48b630230c8fe076ea9eaec58396b72ece3c38e81f68c2b8abf4ce6d",
         x86_64_linux: "e6b75bb4099edb7b92c19c848684a4c84539deb4f51c7da693387b9ad20cafe4"

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
