cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.15"
  sha256 arm:          "499fff2b0380adb7c98d06576ed968832ec01f9d4e93762f6273cc03d9c5e331",
         intel:        "757518a016638751f9b422b0ebdbc89d338396ac3b1a30f8824f6a6107eb5fe5",
         arm64_linux:  "bf6055d30ed047886f2d2fa11220e162255172227dc051f4fe51ea90c673a30c",
         x86_64_linux: "240e68e964f90356fb081413eda87dcf35182ca2915ef61a2497de8b1830acbf"

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
