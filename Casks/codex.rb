cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.13"
  sha256 arm:          "7e247af7825668f5bf8787a58f1a0a225185927a01f6d274cc621d800b404e0c",
         intel:        "8e4db8817b3602f46102675387dd9f2171f21a0a18044f5a479e0e1162458c91",
         arm64_linux:  "45e4930042a08115f207ea81fc43e291f4522d0e98fb2cd2d2fd5b524add73b3",
         x86_64_linux: "0b8340c5275547a46e6d9aa61d8105b46a249595b34ef1ce3cf68edae7fd99da"

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
