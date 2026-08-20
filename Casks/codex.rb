cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.149.0-alpha.3"
  sha256 arm:          "49b769fbaad5d9c0a599e0961da65b7a5ec4f751238418b2379471a869248e85",
         intel:        "bd5686875a8d8735db32106cc7085f58932f5ea87a8dc53ad1bd74ad6f84aa76",
         arm64_linux:  "1cb4c7a1e1fb263f3333f23ecd635b1312c0be8bff67d0d62f14844dfa62da84",
         x86_64_linux: "fcba3a290a67d985f75aa5d6d890e6644922a78159e669f94e7b21a8a14c41d2"

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
