cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.8"
  sha256 arm:          "70436e4bcae7b0b68bfe0561af6818b309ff664b1ff94c09e4616f9997eae0ed",
         intel:        "8b46632a2c323ba3087c78fd41c1323496e6da5a5fc31083b2f9eb0ba9cc2819",
         arm64_linux:  "c261c9205887491f5145f12bd80db50075e31645be90696a2805cd2f879438de",
         x86_64_linux: "a6fad806d11575114de1b40ad36df1cdae8a5ea146989ce4ef5b885a94015be0"

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
