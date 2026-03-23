cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.10"
  sha256 arm:          "77943f9181d20b323dc9edd5b2004e8d4fc5a82f99ec57e74d18707bdebcbdd3",
         intel:        "39ed1f91fe9fde4de0f63584bf5e827aa39be72a506b0de16076f8f1aa690225",
         arm64_linux:  "7ee7ae1800972914665dc231d845840e2be01b7afc261bef57226228439b3a31",
         x86_64_linux: "1e1ba425a249508ef272a0d1d0db6e721e215e021a6dd0e0bd886aa92c514a4a"

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
