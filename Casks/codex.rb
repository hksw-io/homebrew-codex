cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.9"
  sha256 arm:          "87d2105f506036f70cd863dd487c3ef54053abb0e826c36d7fcfe29c920f65ef",
         intel:        "60aebdf7aedf49347a26122db2f5758c056353ca44619e393515c274cdcac5ac",
         arm64_linux:  "c17d7fe5c34a65ae013674ee1974906182d34358f0c1d42bce1575b4af8acad6",
         x86_64_linux: "37b9d943c6f60f7f2c35a2b751e6fc319fa8696b05005a0db3f96ff6bf9a1feb"

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
