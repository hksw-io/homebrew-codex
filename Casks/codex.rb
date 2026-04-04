cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.9"
  sha256 arm:          "5fe114249a103833b15b5509f875660adaab60c053c46da3dd1ec6ca37221d0a",
         intel:        "9189f9e22ea5ad3d7fe376560920c51b7ecafecc5be2db3b3f2cdefc8d5a0d45",
         arm64_linux:  "9057f36e004ab27540e998247958fac552f23b31200bd23f4c7a192a32be9023",
         x86_64_linux: "618c9a06cf137ae84e7802307ada8e1cf54437c62094832798c232b94360b7bd"

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
