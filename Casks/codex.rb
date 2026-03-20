cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.3"
  sha256 arm:          "090d3046a60f96145e8fd1646654f7cfdfb7a1c52f769a02de564a3296e42705",
         intel:        "59d7ca368c74e34d1c16a3f40a82b3880b90bc42004378cbd8045243afa6ee6c",
         arm64_linux:  "4d0b6789c935465705dc3b776d45468f7cb621c5764ba8d6e37d1fd5c00f6162",
         x86_64_linux: "3c7b841ef8eadecdec3819dd65403586df25d24424e0caa617741b5a6353fde4"

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
