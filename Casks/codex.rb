cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.17"
  sha256 arm:          "611c35656581d19b881ca6f81b7bbf83b79433327c6700509f2e2395a6a61080",
         intel:        "9a394a0836ec88fe974631d2079d1b56fc97ad7db0210cad2ea1343a6a60ce77",
         arm64_linux:  "75a051f4d8fce37dc621783055a3da29b8dc8c90af6464c4702d6d1f417957f5",
         x86_64_linux: "53952ed62d5df04a53eda10bd3ce3b750dadc2af7e1d3c1012d9463f31e8aaa4"

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
