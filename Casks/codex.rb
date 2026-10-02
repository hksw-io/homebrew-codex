cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.160.0-alpha.2"
  sha256 arm:          "d8f24dc6565d73c166ef5ee72122f5870a9f83ab4f1a0e5e1ce722cfd14e9681",
         intel:        "44dbde5770194a5dac6944b78852679bb257aa74f348e8ca6cd15bb946a2f516",
         arm64_linux:  "2cc4c3d9f82b227de1c95f92ce3edeb2e206905df9dca538da809c0f6f67eb8e",
         x86_64_linux: "6a5ad3c6546c3128af309c3728a9e6b31cca4b24b7c4d11c76f7fac2f6f5b3f7"

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
