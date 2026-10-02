cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.5"
  sha256 arm:          "25957701b1b7eb49b25e518d3d90b53430c60a47fe86a82db37d4e3bb4c9b673",
         intel:        "a9e02ed8e41291ac69750f5bdd341784c09f457e5533ce9e1ed8973a3c65aa31",
         arm64_linux:  "48f499fb27369b17babcd5295d1b8d272ecc3d66aa1aec8d51f432c88b197ab1",
         x86_64_linux: "a670823f50b38ab18cab3cba3ef75322d275b17488b1d737e9a10c79fa6ebabb"

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
