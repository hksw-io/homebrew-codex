cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.1"
  sha256 arm:          "c9198443296e62b7d3f907c8719db2f231af3ef95694372f887b7df8c3416817",
         intel:        "be8924b88c6ccab4ee0ef65dcdae04297363b6112a3fa47f21cb897b2ec75cc7",
         arm64_linux:  "c50c2af8e23d4b9afe764e82e8eb466e7cede235eb4d5c2e17b60da444c5d6d0",
         x86_64_linux: "79f9ea35de52052fee056bb1eec1d18727aac6554c2c4d12b4c8d534ec6c0594"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
