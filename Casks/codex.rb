cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.12"
  sha256 arm:          "b8c16ef310fccbc74016aba56f9ee04734fb74b39a6d246daafca570eb807a25",
         intel:        "a29788301ae814b91a60c34cd6124e915c12ded23b67bf75c86d914dbf5803b6",
         arm64_linux:  "22382ae885f7f51b824aabe4050c3311b66d5352baacd19ffd3b775484409ded",
         x86_64_linux: "0fd1b76c7ec613924e0a72cb3cef9ead72d6886a4679135292d75c76bd39c2dd"

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
