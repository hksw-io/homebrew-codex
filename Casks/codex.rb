cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.20"
  sha256 arm:          "274662666daf50358de2dd5f7e540ee6c0056656ec75661d8de955ae7f2e5e49",
         intel:        "0a4a144185af87dcdd532941b4533dc5062ca5eab1560f157b9f557f623e144d",
         arm64_linux:  "a85138202127a098defffe3f499615bd26a3e4a18401fc69121abfafa48c1ac1",
         x86_64_linux: "1d2cc4f8a3f01ca36bc1a0ea429f758fa83f56d5303ff97a1d2b925c2ff06668"

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
