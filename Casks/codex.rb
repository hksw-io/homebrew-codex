cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.12"
  sha256 arm:          "68cfa36104ecabf1d8c098d0a972374c6389caac281d576558668f962d4c9a06",
         intel:        "0bae2766e91670385e03db884067d7eeba1c02e9034cc83f315016779b653fea",
         arm64_linux:  "a2352446a2d625d09b2c9ef0b137a6fad09641f389127cc87e7462834202b527",
         x86_64_linux: "9fe9553776913b3c38f83fda62332186799f1096afa67a226a6be9bba1f5695d"

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
