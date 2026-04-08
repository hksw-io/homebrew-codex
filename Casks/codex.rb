cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.21"
  sha256 arm:          "a8a61ee08c3f812e495d1e695548ad7a3e2e3ac5309cc39654e48ac93a802f24",
         intel:        "146b729c6f3c4970e048d64a7267cbbdec8ca82e5a17ef941e20a2663f8c4887",
         arm64_linux:  "38e988a941ab2937b40244e23abf58f43d9ccf53af5ad5ed685ebac9b8b86cfa",
         x86_64_linux: "564663af815094ae02969425a3090db785737ea597557bfcb62d76aeb0b07aa2"

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
