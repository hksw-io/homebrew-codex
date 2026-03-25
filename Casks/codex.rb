cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.15"
  sha256 arm:          "8629dd753f24cc8e580291d5b61a17a7aa8b338825d3c0be42dbb558ce233506",
         intel:        "34f4b472f9ac626b4e5cc89a29cf7db64c1f8fb5adc3af6225898e2229611386",
         arm64_linux:  "c36e20b39da64ad246f18312c805c3fb6587fe01089fd94fab55109bd8edc4c7",
         x86_64_linux: "087518cafbb5c1eafcd653e03d1c026b8133f7331804f9860ab2277f9f01b94b"

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
