cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.21"
  sha256 arm:          "61e998b8954035edc80f17d3a6c9f1817955f05bbb64a17ca7eeceead100577d",
         intel:        "32333dc8c18d765142079e5171ce83bbeb3c9d744dc6b16f40b1331b324f3ed6",
         arm64_linux:  "788024414502778ff0d7f4df2264847bab731a9fe584c2b5dc37fff536e36baf",
         x86_64_linux: "9451397c204c0e63cf7d2a6c0b4040e7bd0c11c829c82a989c7e9e8b3dc7d5e3"

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
