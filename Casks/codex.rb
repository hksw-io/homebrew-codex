cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.9"
  sha256 arm:          "9a4634cec08c54f8a7521568479e88205e6c45b728dc354dbf0fc3236b62877d",
         intel:        "a52257b309adef5467d160080ae8f11f370698c26d1338512982a2ee109634d1",
         arm64_linux:  "fed675c1bca48f8faa8e796e3499b5c5e60faf89c446ce3db41cbd7ea6a2621c",
         x86_64_linux: "e6ab4bf36599f77abfafdadfebfd641bd5b3905bc43ac17b5872a7b014bab588"

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
