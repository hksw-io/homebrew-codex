cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.13"
  sha256 arm:          "466841f2b567624aa52886d2466f6ae8e04cacd3698fcdc67392c39698c99457",
         intel:        "0cc1bc653f44652149c53be240b6b2e64ac35e04d59c7dadcf8cb4b43d715a54",
         arm64_linux:  "d0aabe17b852c1d6644c2b818bbea511540338040cd30cac46c355f9f663b374",
         x86_64_linux: "fda43d8920679b12123993be5a0dc0132636533950a1c73a0eafd3ddc65509d6"

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
