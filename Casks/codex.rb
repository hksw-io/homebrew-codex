cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.1"
  sha256 arm:          "5c691c657e154346757f6264182bc54cc2e17771589de7fd7d2f9eca0ebd890c",
         intel:        "b89961e3aa0d160432b259fd794b7da3804df9299d66f64fd7d81c23e1c8f2c4",
         arm64_linux:  "5105fd4ce9f2da46fde259def8778363688697f1f9112192dab6690ad631be32",
         x86_64_linux: "b062cda4cfeede49730ee9faa3766c64737ccc2369fc81116446a95ba414271e"

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
