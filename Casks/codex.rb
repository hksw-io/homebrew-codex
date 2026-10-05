cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.16"
  sha256 arm:          "64beffbaf8c87fd3c9c49782106c5526c280bc4360a48cc2f781758a010705ca",
         intel:        "936e6f68bd50b387f6effaf81cdace04f73776a33de57fae26d7303dad9dda4d",
         arm64_linux:  "775622056f7127903767eb13d93b752d18bf55c29c54284cd394bc7884bb3d5b",
         x86_64_linux: "f8a35d492c6723f257d98e7b6ff9105ab21ab98a85a46ac5a85c45621a158662"

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
