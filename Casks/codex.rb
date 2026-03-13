cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.15"
  sha256 arm:          "0fd2ef15d13a3f9b9e48877b14c37f53cd3fe56643e38bce393e202df9596078",
         intel:        "a116b2625d08a583987418f470bca0fcf07b811100bf733b33a6166e779859ed",
         arm64_linux:  "6f54d32bded852dd4ad33c99dbe749d7b04cf2102f9f7ce99642dfa9c374415d",
         x86_64_linux: "19f7a7dca901939c4c69218e212aaaa67da390d85c777d399196ebcf20bf12f1"

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
