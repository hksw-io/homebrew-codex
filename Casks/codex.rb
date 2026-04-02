cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.5"
  sha256 arm:          "395fa9ca4475382500a029ad7a6948855a8f1dd278492246633349147112b9cd",
         intel:        "21946ea02367520856767a6934c98782cdbd88fd6f55245b1a1c8fabbd69ab0a",
         arm64_linux:  "9d7fab1e288400a52db4a87d7a49b70643db5d072713dde9f651928d8ad0ab8a",
         x86_64_linux: "5d1751b897cff068e36d0d0ee4a9c9a9879b35eea365476bdaf014bc2d6e0e07"

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
