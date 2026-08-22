cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.7"
  sha256 arm:          "a41905fbfb3fcfa9d4e356b93d8046902e5faa46b18515f285535ba94e1430d7",
         intel:        "be9e9a8521f46e722d5c3038d2bc5fa86a0cdc55ca02668a75b554a0c3fee63e",
         arm64_linux:  "f42f8e01148f488ee61e9c288a74268c18ef917c99b74e2e0f8afb12dca1a5f7",
         x86_64_linux: "226c5467aa4a5e0cebbe0cf4f924222c6719dab218d6e400f9949c30a04aab6d"

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
