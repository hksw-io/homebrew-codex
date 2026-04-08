cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.24"
  sha256 arm:          "3769b07520b853082bce706fca2c9326f52da92a2f2dadc256ea7e2c7b88551c",
         intel:        "0ce66598dc00b88d4de1ff31d82c80988b92a2dd840e014411e90ee6cfdc3df0",
         arm64_linux:  "8ffd4ddcc127d7e104c40ad29d3e43ecc487ff3e6550e330ac59871b77684f8a",
         x86_64_linux: "555b9c4dfa3ed4964d4d105d1b46bbf97e914518f29286ff9035aa3b0cdd5f69"

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
