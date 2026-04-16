cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.3"
  sha256 arm:          "0b86c8968ff5fb0e246871f1cae93cee5c6b2ab989b16a83f26ad2c94957b2b9",
         intel:        "50ccab028ab2cd2f714850ba91c3ecd5114369f8a0382c4399801a321df45a1d",
         arm64_linux:  "5c23d777b261d37a329af7fb189fced1f446ca5102b563edab67aedceda16688",
         x86_64_linux: "89dae2f1d7036f625b77a581778479d9510d43e9b58910e12f6a8e61d8037888"

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
