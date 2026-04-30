cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.17"
  sha256 arm:          "16bdcc4dd36d68fba1e62215de98659263186959fb0e396afea4920ac02dbb79",
         intel:        "8b2480ad9dfaff86c438a9fefc19c58445aec93c4919f1e833f7de1712a2e2e6",
         arm64_linux:  "fb977eb7c954575ce07ae7e626c71e6cf86470dd1716bde17c77c317eb4ecc27",
         x86_64_linux: "1043639d5b49504a8267ea70d3578ff8f316982399ae8d9da761ffeb7702a35f"

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
