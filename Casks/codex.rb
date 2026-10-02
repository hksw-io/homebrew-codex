cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.14"
  sha256 arm:          "3505f847f8f7de2878d57fb2f8dc8dd4f85a6163f3eb03bdc2ed85d66abc1a8d",
         intel:        "9dd17fcb404cddee1b065e004f8e16a51b818536a6b48ee3e54a9dc2ff6a40f3",
         arm64_linux:  "f53a14a6dd58f3995f0fba67eef01af222e34875fbd8903d43c6145fb86ff077",
         x86_64_linux: "516c6a74c5fb8a47b36e2cdbf3e228af712e481f28122a47c8d6a492af5ed7fb"

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
