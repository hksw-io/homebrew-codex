cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.21"
  sha256 arm:          "6030aaa19d6de8f115da21dc58c32099c2e643793e779c94e3454b1ab45f387a",
         intel:        "2a75f7d398afe169a36ac14a993b5bec13ff07eee1aee3568fa77525bba4f078",
         arm64_linux:  "778c7ad4fc75f5aa20800641a8f016a41db932ece7d6127f291ea9974732617b",
         x86_64_linux: "b46b118d6b6cd6f55494fbb613204617d6eda7d9f3d2263e7530f23aeb498bf4"

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
