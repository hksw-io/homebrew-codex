cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.3"
  sha256 arm:          "cada22253742965afad6b86f78a4140327d8734bae6c711d97ad601b5ad1163d",
         intel:        "322ffddb07eb564dcb2989faf64d39758750e2ffcb64916a4c1cfa3349789f11",
         arm64_linux:  "2656489261f65ffe8dea58eb57e0f743db0c857ac5c215450cf6b120f130cb83",
         x86_64_linux: "28ca81085d9b27270cbb72a8e2bba67c748386a168edd8d2d6ecea3f6f01ef45"

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
