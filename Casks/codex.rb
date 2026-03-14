cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.22"
  sha256 arm:          "343103f76e6e9520d7644cd6f0617fe34b6d764e22d8e80b10ea763e812e3268",
         intel:        "b618fe91bcb62f5dbfc9f22303a1b4ba91403733585a15c333ad7d1cb9a7df2c",
         arm64_linux:  "32ca8325ea71bfc2918d75270b203c3028a6d85262dfd4088b5dd273af20bed4",
         x86_64_linux: "cf46ffdc8f4c1d25cdaaabd0e9e2174d64a367303892b6a96156deceaba1a697"

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
