cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.5"
  sha256 arm:          "4d3fea4c3a332212576477192ea706111ca42c20e21e61ee216afc9395b2eff2",
         intel:        "db7f6a1c91c0148698036a619fc2f0e34403a59b8355b475a021a70b52356495",
         arm64_linux:  "c733479141fcfb763c011bab5aabd1296bf866c142646d3c52929d4b04c69f33",
         x86_64_linux: "baa6677aa7843985b9e2e6e08b5038e094a32c70a2db4c568e30e5bebfcba6f0"

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
