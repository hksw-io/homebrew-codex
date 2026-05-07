cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.15"
  sha256 arm:          "500955c3ae629a4798d12b8f0c904f958a3a582a6390091e4c8e054b864365f8",
         intel:        "7bcedcb64653815cd1957bba1e3a0245f1e739bf7867a8ac66b999738a0d6075",
         arm64_linux:  "b44c52d5484e1d0bedb78b236cfdfd5ad215e5540acbeb6f5cc4ac6e9bc08691",
         x86_64_linux: "cbac890b22472413320625ff3dd47e78fac2c684df82dd55f8502c1a2b6455fa"

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
