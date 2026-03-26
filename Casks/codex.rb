cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.24"
  sha256 arm:          "8b596632b28fbff32b41251e6c6084bad244ce571a733c92e0ab8dfa3250102b",
         intel:        "0938e367e8b8d74b6da3b0ece1e6ab76f2a4f2016d702177b1abc32d5ecef3f9",
         arm64_linux:  "71ca9c46e17ed951343a2ebecc944fa9d79c37b0b2aab0f5e84df452369eb8c6",
         x86_64_linux: "bd11fdc5144765339119a1ad4fb6c7f810e969911fc401765cb8c9cf1baeae4d"

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
