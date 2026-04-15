cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.14"
  sha256 arm:          "305afc0659d8ff4ea5b6de16bd4e8d0f6c7cdb242015ec632b97e87eb8686acd",
         intel:        "eee72976ed6b0189d9befd68422a4df858bc7b3f8346782c67d87af1666a5182",
         arm64_linux:  "5bc7e5ddf33e9ce0caa1a8e1cceaea7babc827b6948fdf2246c43bdcebe96cc0",
         x86_64_linux: "48d90e591b2ab52c2e6ce8f72e6c7c940e24f3da929ea7623fbd200f82dd7785"

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
