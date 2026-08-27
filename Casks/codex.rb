cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.7"
  sha256 arm:          "ad28f0835d3f3308d9a41e65b2718942add33527b48c6908cecc9915f55b054a",
         intel:        "c17df2feb9580754b0a42ff9a3a5706be6423dfad0acedc1e757ac99a1b8dcc4",
         arm64_linux:  "a346a84e810a680ba0484fc694f20713b5211968309a67ec43983f4bd1a68311",
         x86_64_linux: "4e754e49156cbd7ac48acba3268b7ba033aae1337363ca4b8025bfc5687dd3f9"

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
