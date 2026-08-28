cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.8"
  sha256 arm:          "37c005078b205d5b908d0eee3439b28d422959b148852976dcd11c6432f3d5be",
         intel:        "bdf0533684fe7b40d8ab4b67d6e3d4c606b7c65c79ece344f69d11da1124caa3",
         arm64_linux:  "fca855264adff9b8976578dc59a431f7f34e5b4e4789d307407c9d02a4d5fdc9",
         x86_64_linux: "c5ba03a63dfe577375ecf6e1fd809af8100eeb87516acaaf849961f282840cb4"

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
