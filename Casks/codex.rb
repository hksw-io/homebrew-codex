cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.14"
  sha256 arm:          "a5265ab236bce991f15d7e1a3b915cf3b5d4f8f92f08f4948e69e4e63d7618a4",
         intel:        "b1e1d5c24f7d3c3b54f58fa706ecceac77d4298ce43d0e1af91e2d2d30c52fe1",
         arm64_linux:  "2d2c7e56006b196d33effd90a35e4b8abc4e6ad576dc589448d3c2098e392cb8",
         x86_64_linux: "c5f938ab4e5f680ee347c50bbcb0f8a7bfa946d3a3aad18ca4da399a5504c841"

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
