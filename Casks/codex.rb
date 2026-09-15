cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.2.3"
  sha256 arm:          "e90ae1f1d7f31bfc807baccd5f5f92768131b7263966b891379a1668218bfd85",
         intel:        "ed7a8166a0dbaef66ddf65a524c32baf1ca6af6467b8ebef668be9cc197048ec",
         arm64_linux:  "f6c2f8b553bae31af9936fbcff78c69bd8714d5c8774fcdeb4c147f30ee3bf85",
         x86_64_linux: "df18baecec8566d2e4a5546bdbf6fb11c1176ffe232278866897af9e9a5b5cab"

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
