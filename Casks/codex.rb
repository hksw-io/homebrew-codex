cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.10"
  sha256 arm:          "843f537d0390b69aba17f0e8f2ade18726f330cfb845f2741e8333560380b39d",
         intel:        "20c08f11edf0df3941dff61347d00a50b1316aba6506ba152eb0e28f5f2a333d",
         arm64_linux:  "604780063a5f09c55589e6b751500287bd0a1146da67b57db61c2f9494c66fa7",
         x86_64_linux: "0583b90da1fb7572747d666d6d4ee1a2ce5dbacbed5e0887d4f513ec04d7c161"

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
