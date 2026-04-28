cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.9"
  sha256 arm:          "4b81d4e570287a2a4b5f4686de1c7820cc666630a9fd90ef52531cdbdb08f199",
         intel:        "2bb87b4bd4ecfc3cb30c4efe9777ac1d0e1566af816f2a3193f0f6a4232d92b1",
         arm64_linux:  "72e8ed02bc9887760448be9e4bb2e77de3d3c998a46980134067793da1e9fcc1",
         x86_64_linux: "74323e1ba775afc03ad1a9960180bad1f5aa369578fc8ef608eebcee9ccec6eb"

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
