cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.12"
  sha256 arm:          "0c8ac6b28c2e1030827f7ca8da918ce6a408701a922bc206b5a41c6825d8d3c6",
         intel:        "7fb916dc96ed42ca24ed116d2e439f5a96c56936b195007366b3b7b449aaae30",
         arm64_linux:  "8ea6121a9e3a256378a3cc1f2833158f04cb459c129fcd62b8519e496b2e43d5",
         x86_64_linux: "2e9b1d7dcceccf08092d1cefb711b80a09a91a8b82890a7aa2f5d6e46f069737"

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
