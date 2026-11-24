cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.4"
  sha256 arm:          "7ed0843aa91ffcf9892247c591f8ea64d7016887276b0f5931a612b91314c9e7",
         intel:        "06e24d82513567efd5e4037f690e86f051cb6976afc41c49b26e0576de180867",
         arm64_linux:  "0951c1ee17b7cfe6367764fbc22548fcfa18b581358f29a508d0a61489683e4d",
         x86_64_linux: "018744010f1eabbd0014de64c2fecbce725ff353cde4eb0c425d6cd6193028cf"

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
