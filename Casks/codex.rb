cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.27"
  sha256 arm:          "cd52f39ccf49754e10cbcb8efe534bc942e9dd5cb0f9a828b20192293efeae3a",
         intel:        "7afaabfa64ab33bcafb5dfa8195f4245b475dfcbdaae89be062577c11cca24f7",
         arm64_linux:  "777f24e42693d8c447c7f0d91605d679447904884dd3351d2896cbfd1f5c2bc3",
         x86_64_linux: "e21d069dc4d40874720f8f15310df90c122567f7543b43871d23ed203ee72e54"

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
