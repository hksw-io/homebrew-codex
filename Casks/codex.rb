cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.1"
  sha256 arm:          "6a3807754753dc2f26d70f4b25e2a737c6f66c85712ef68459b9280c67484eab",
         intel:        "9821b2a8ab25ae8ee720010fc7f670361efbd1932fa6620c8015c4ebed6c49cd",
         arm64_linux:  "7c7574cc72b0e5a19068d96a725fbd03e882bd90a64ed380c4bf66f8e6d67e46",
         x86_64_linux: "ea14e4e92ba56e7fb57983614f8c9ad267f4d564e0406c2cf341641cd6bc161e"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-[0-9a-z-]+(?:\.[0-9a-z-]+)*)?(?:\+[0-9a-z-]+(?:\.[0-9a-z-]+)*)?)$/i)
    strategy :github_releases
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
