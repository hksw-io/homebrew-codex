cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.11"
  sha256 arm:          "8c79e8d029131e156366c89a0c7c41b3d047171a14b95a02546cb042f4a530fa",
         intel:        "b2260b0d7a95a45d25d85faa0ca8aacad5de77dc7eff9d3fca821b1a91849d16",
         arm64_linux:  "b58a86cd812287a87a62d908043b2524da86805f41aa844180b7370c4a6d424f",
         x86_64_linux: "90bd5baa7ddd6fca9e684524708fe3f823cdc48b4dab98cb6926e775ca0b83eb"

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
