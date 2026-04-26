cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.3"
  sha256 arm:          "f25512d4eb0673eb8116c885a513531eaba71690f0bd2db81b0389c279eb1868",
         intel:        "cf1a4d72c39ddd6197adbf2a92bc22748fa4269119cee642c09214567e52cc14",
         arm64_linux:  "0f38219123ae1a4ed087d97b403620763702582c3bdb2193ca05e8a39519f42d",
         x86_64_linux: "d598a4d2e9307f2669aedfa2f96881645e0fe5b1effa2813facbeb531caca4b3"

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
