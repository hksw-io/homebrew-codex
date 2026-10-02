cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.10"
  sha256 arm:          "5f4df212b2a3d1393720eff84d76247711871c87f2b45fd1b4cdf179bd571b9b",
         intel:        "adacba5363a9d2e0f5764f624db61032413d3f2de6474a85ba4dbc903473700e",
         arm64_linux:  "fe81bcbd8648af03afa875c82a8086c5771f3a083a26bfca23270e77c8ff596f",
         x86_64_linux: "6dcf96f3e973cb614547b5f42389feab779e79903eee510b5959f6eccd8b808b"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-[0-9a-z-]+(?:\.[0-9a-z-]+)*)?(?:\+[0-9a-z-]+(?:\.[0-9a-z-]+)*)?)$/i)
    strategy :github_releases
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
