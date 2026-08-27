cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.6"
  sha256 arm:          "1b5f90279efe45dc203cb82418b44f3afb1bfea1d3957d253cc690e222861b74",
         intel:        "477fcea13a9a296f1faf5b3fa1c54f1dc4ef8ab95cc12752f70a76d9c6bebad3",
         arm64_linux:  "b4af1a4d72cbedecb7a4afeb42976f81e37d34565c23734ef92c1ffc6a209619",
         x86_64_linux: "4b9c4317d5290629cf340a20d9fe53f01f0e75d158e25bf39783b068d65a903a"

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
