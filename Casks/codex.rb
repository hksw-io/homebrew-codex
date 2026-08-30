cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.152.0-alpha.4"
  sha256 arm:          "9ab272651070ab3b1096e523143ce533e9df5409927dc7f53f9288c2b0ab9e40",
         intel:        "56ffe1cc8d5a124f6ca5af4a396f792e19e8fc33263c4fddcc64b3006688a62e",
         arm64_linux:  "d45329e4f8c6c77bfbc1d274250da7eb2dfab2717c4ab486b729a4628acd7992",
         x86_64_linux: "d978cc2b576db179ff88d072cf0ad4fbbb32e1d33951679ec73b8b7950d969e4"

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
