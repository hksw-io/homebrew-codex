cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.14"
  sha256 arm:          "579fa909a901e6c38425b1cfda4bc3431ed987befc1795c0a417bcc4d33f98ce",
         intel:        "b3c775c8ba273022c76965abc8c158a4a7feafb5e12444a1094aa30a51b09c5e",
         arm64_linux:  "24f47feaf8cb56039775f64d2a12e6f4d82037be444e4983c5dc708777aa66cd",
         x86_64_linux: "7f640b69daff4925b5dad73ccbd5cc36e310d5ade859cb9e32ba0136b0040345"

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
