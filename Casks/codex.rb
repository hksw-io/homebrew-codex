cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.11"
  sha256 arm:          "66b27c99be246bbb7163df0b6a4e4073ed086b960f260480e41a0f350222f229",
         intel:        "6ce30dad9ad542a623ccac07a28c59309d34707ff0043fa220b829c6fb34143b",
         arm64_linux:  "c49085e1b0f31551ba82b1b8f9efbf5a159a62042053fc114803016159e51167",
         x86_64_linux: "745dc55b755ebc794491598aa015bed74128c96a1e37cd3b10fb8e3022e7e5ea"

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
