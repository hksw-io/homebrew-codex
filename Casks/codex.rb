cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.11"
  sha256 arm:          "b002414590121957ff13ac0249801133ff1c170a070a7cf4633dce989248c6d4",
         intel:        "fde9c902f7e576b13e0fb02524615ba4f3861df0fa9e43432a6357e676d9988c",
         arm64_linux:  "8797b237be00ba622bee9efee41a8ab1106dd1af33c0a36bd7fc5ef03617e251",
         x86_64_linux: "89fea298253cd38348eac8d7fadd40ae41bbc7cfed4259b6b442885b33f2f937"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
