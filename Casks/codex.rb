cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.12"
  sha256 arm:          "0fb5dee549e646854b93d34b86d831c7548fa9b279f953e0fc6577b87b76029d",
         intel:        "ad291d9f3815a5521161ad9c4b8844d20b07f1c67ccea5874f0ee73666f5978a",
         arm64_linux:  "e96b53715aa1fb9fcce0c1d40cb4694716419f10b0184e1d03b36feebc87ddda",
         x86_64_linux: "951a00ecfc4b4d133d4831242a2d54eaa1b6ddce999f554760eaabbbe100a9d1"

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
