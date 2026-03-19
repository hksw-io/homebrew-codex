cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.12"
  sha256 arm:          "11411ef39d010d6302a54072a352d6504bdfaa852c338888e022c74f7e3e8031",
         intel:        "c63811fe7bed5332f583dae2f5179260051796305c886ffe48f1f7af97a9acee",
         arm64_linux:  "179eb6d9cf465b1cfed52e3cf00fa5319c04322ed7cc04726374319446dd9b11",
         x86_64_linux: "7f0abf28ad80e2882586a4c6cae39c46482f6b3883febf71d5a2038780f92de8"

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
