cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.166.0-alpha.3"
  sha256 arm:          "446bf7a566cc1cc15907d241e84ba83a04d2d9ae11f0ba35037ebc4508de49ae",
         intel:        "8c7694c30ce7a109dd7012b15d5c118d36e55ef5bb9d0c2b5a6b06e5f89dd44b",
         arm64_linux:  "4313997567e5cf59de218957d7bca5b68bc16f8e4f4cc07e23cf78bf4f6419f7",
         x86_64_linux: "85a20409d9eeb07e8b82073d8f9242f5439bf9ecf903571b5f8fff6f4ab572f8"

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
