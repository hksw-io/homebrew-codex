cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.15"
  sha256 arm:          "786fad8ace558d0effe86ac4e3818cddf7c5d9cfbf231798a3becdf32783fdb5",
         intel:        "db2495bf195778b4e71d80e2c8b67fa18c7386d0e6399861335aa89e7563b82a",
         arm64_linux:  "1ed9b78912b94689b3d844497decd2d290333b75c738a04fc678d42797e4fdeb",
         x86_64_linux: "77e9174aebe52d61d851fa3b42fcae2b0399701b1642daf9f4dc95cbb88bbbfd"

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
