cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.11"
  sha256 arm:          "00bddd8715740fc0a51b048c469a5c8d77ea700ba1b469b65a0a6a1e7fc72820",
         intel:        "a7196491d24ce227941cb372bb36a425c69f59075f295e2989df9898c1297a10",
         arm64_linux:  "01b413424b2d9450859e0ed7fab476b3160723e87143396995e33bfb1523d965",
         x86_64_linux: "af0cf8ae1e0af5bef08452973237e09aa2a7c1a4fb6bbbfc6507eed602708bf3"

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
