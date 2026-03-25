cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.17"
  sha256 arm:          "0ffc3deaefbf8659eb450e02a26a2d772671f2afadfc7c7d2c97a6a8e30765d7",
         intel:        "21d455a1123ec6ea96c3206a10e477ed84a6099cd1bc8cb899ed8671a585cad3",
         arm64_linux:  "39ebf2c16a8d8ab48048968dbe505d3d3d94bbcf23eab343a894b2396e8a86ee",
         x86_64_linux: "72d503ff54a525a96dbe0d91a497e1c9442e1c40b6834e01073987dbc83a780c"

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
