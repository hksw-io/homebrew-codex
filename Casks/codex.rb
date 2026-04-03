cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.8"
  sha256 arm:          "516575babc856bd9e88e0cb4a30b103b8a86e75ffff8fbb5cea9f24bf4ca9298",
         intel:        "ba4d249720616cf4e6c22e69343528cbc4bad2a7aaeab13e6055b3a28ab92679",
         arm64_linux:  "980f1201dccf23551b13f56337921a4b57997e966125d5b10324332c66d35bb1",
         x86_64_linux: "a18c6d4e8d632a5aa41844bc7f616309780d10bc79d486d721c679a6c137cb6e"

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
