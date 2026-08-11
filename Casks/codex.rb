cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.8"
  sha256 arm:          "0c62df348b45a0eec0ccfc35a58f9b5bc3e3959f6f1172cd9fc143cafb62f984",
         intel:        "2a668ec84f9884e85d822d0fe977ab0fa6df07d382b1b91adb3dbdfe54b5c00d",
         arm64_linux:  "8c9b29c6534ef794807059995640e145c96a851cd6184c9453132de922f2010d",
         x86_64_linux: "c8e8e6d114a22b08a2e5a250514cd3a957824418144844ca68cbc8e9f5ea0751"

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
