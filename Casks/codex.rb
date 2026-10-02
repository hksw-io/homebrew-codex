cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.2"
  sha256 arm:          "08069f129f2e1359ea57a41cc72ba8993c9f3edce4c2265b14535098e1453cc9",
         intel:        "c2671f5e619459fd47071e827883e77acd10962bfa1c19c412ca37e78de87ddd",
         arm64_linux:  "90d3e3390ef9c61e449a5bd028ff8f631f4908b0a069001ff2d2b0d8ae62600e",
         x86_64_linux: "549b646ae22b57e3c5464ccb34f9aae11c70f4a751444e7ed2d6046ef875ec06"

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
