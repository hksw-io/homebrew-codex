cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.149.0-alpha.4"
  sha256 arm:          "1b4fc5f00e77b33cca21bfaa3cef9aef7c2b6f56236b16f3cec42532ecec41d0",
         intel:        "10dd69c93ca62704331eaf8c8769ba86144b1e8a42eed249ec08ec9cad2c7836",
         arm64_linux:  "985dccd1e0f42dfe01466bea176048aaed85446624a804b19a5b36b2d2bd239a",
         x86_64_linux: "8309628112a385d5bad2a1a004e18d0cc1f7c52cee6d66526c0cb65912251e4c"

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
