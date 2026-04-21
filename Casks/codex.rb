cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.2"
  sha256 arm:          "e90778cca8b5d2a09f96bae104162e9978e979deb941cf804cfe95d293b910db",
         intel:        "01f402b46e5646252326c9ce0fca06693ebb217bf3cf984e90610ffa4aa013f4",
         arm64_linux:  "b5868ceddeaf695d2e10a4c717471ff73194f983ad35b6d134d31fbd37b9ffad",
         x86_64_linux: "38a29c6dea512da48aaecde726d4ce62b65eab8d98a2c95c4c02b9de321587c4"

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
