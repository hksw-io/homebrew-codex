cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.2"
  sha256 arm:          "660bc7bf7eb7aeb27ef289fc5138109a06e00a82a3ecf290d4e3ac643f4da30f",
         intel:        "12d8ca01ae95b02ade157ac245e39dece73544c1c245dc2e15004fb965e454f6",
         arm64_linux:  "db66da3c396846ac62202016da72aa5691b829841e70d37eedcfc940b1451e5b",
         x86_64_linux: "c3d5981b9ecf9013a0eb7cd585f2cee8543f8c9717485a818661debba6a40a0b"

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
