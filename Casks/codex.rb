cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.9"
  sha256 arm:          "5f8af69e661501c9c536daf4236d2c4a7a9a043239fcf4a75c2c29df0bfde813",
         intel:        "53b8b9d3a71c4819e7f7e85de7d2e151375e4c1bc2d56f7c8e81391658f808a5",
         arm64_linux:  "578d6842a1e6dba7622cb9f30eb03a88a12eeff506b2e3f5ec44ad27c7ad840c",
         x86_64_linux: "309cf73fa8d2ddfdceb3a7b076aa78da05d59ae1dfdc4f60a85185e905926618"

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
