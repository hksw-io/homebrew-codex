cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.2"
  sha256 arm:          "89d167bc7b1f48cd190a007b7348be42cbd7380cc0405b9f973847453146a906",
         intel:        "174bd886d35c15a5c8a2f8acaf5326607d8c193696edc3ee6cc9611e4602e4b4",
         arm64_linux:  "dffe2003c49f80c2eb5f163bc92c16d5472af495a8d3d5386adea1c354e4eabe",
         x86_64_linux: "bcd5df1b4842a735aaab2502a049fb9287c94c9fe67b317a7c10ce647a6b1983"

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
