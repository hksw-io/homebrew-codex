cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.4"
  sha256 arm:          "f420a12897aa3db6c2cd5b24a47d1009747158f930a44f6a52c6db7132883a42",
         intel:        "a7aaf46d5db74d225beb6d82916fe5b829d66267171414b23b1bb6d37c5721af",
         arm64_linux:  "15f6109349d8ca7d71655555dace1e2bb1ea012a5d4a02fa04b0f2d5b3e299b0",
         x86_64_linux: "4032c3332b8bd446bb8afb098ae602b49572bc8826b759310fd5373dff5f2911"

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
