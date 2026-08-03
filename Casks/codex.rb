cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.6"
  sha256 arm:          "870e2b8b80d5c71a63e5275583575cbb6234fac7d3859ff11db1133d195257ac",
         intel:        "55ed60e2a024a75023834a7482610d3242da009a3d6221b1fea2bd501468320d",
         arm64_linux:  "975cf4421ae2fe9a787149c4e5d5f12561323c3b8d872bdd072e09ff3ac182c3",
         x86_64_linux: "dfa1be492d64fb07099b673599fcd8f0229e6131bdc3a3b0370a79893632fdc5"

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
