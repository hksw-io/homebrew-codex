cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.124.0-alpha.1"
  sha256 arm:          "4ae5772f61bb72ee6edf4bc5a7c322943bcb2de6e799c03d6532c6a8953f42eb",
         intel:        "ce93ac6194c190877ba20aa341da2166a7a1a94afdf8d08a304772789825c2d8",
         arm64_linux:  "c48530349a0bd11bb8cb6f76d23daacaa94fb917b37f576e4e2028f514d114f6",
         x86_64_linux: "a2a98ba93e5e76e2317feb57e3f0e8ee8d182c8897a6af0ebe0a5e6bf4c7e104"

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
