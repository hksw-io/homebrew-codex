cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.4"
  sha256 arm:          "6a7dc347e092fd909759688f840161a9efcd870d4e395dd180f9101d26fe3389",
         intel:        "2192c6a01be0cf715a589e765d471f4aa575fe01d51ff90ba483d9495ff705c6",
         arm64_linux:  "895ef0ff8c892ee6b9876de1769e446e3a10663cd4e470a2bc1e6dce19e816ef",
         x86_64_linux: "493f579817a64a70578aecb975467b8a926786b5e10b16301b55684cab0f48c3"

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
