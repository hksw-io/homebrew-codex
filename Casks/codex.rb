cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.2"
  sha256 arm:          "57dfd662a3d26df947ec3dc81e714027d05590312393cebf919b6e8eaf8b5529",
         intel:        "432ccaa55623393e33864bf78f7b2ca05a0b7d0d5f5b24b450cdc00384c8a543",
         arm64_linux:  "e0b9467220c1ac858a9d8f77713cc9071c33417ee8b55b389ad9de6023a62d2f",
         x86_64_linux: "2e863f91da25a993b3c17b37adca855d57b3445460f9567dbf140fc453245a3b"

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
