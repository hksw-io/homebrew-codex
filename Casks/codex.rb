cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.15"
  sha256 arm:          "5579834b82a39013218ef968db84bac01c9f303589b4b23478b7164599d76ef0",
         intel:        "1a19e243d881e655a56c137868c4b6df7fd0dbffcdaf996bb37a1cf956b8dba2",
         arm64_linux:  "e83f597ae854d4ba597c89cb852ca004a554cd3f07455a07a9cbbefc771fbd50",
         x86_64_linux: "862b248dc04fbb5faaf9eeb07af988eb309c6fddad38c3f92d75d10e680a8e40"

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
