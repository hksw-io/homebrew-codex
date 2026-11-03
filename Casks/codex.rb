cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.167.0-alpha.4"
  sha256 arm:          "2a8d5e7b07884722e0006843450173c885c1e774dee77d1a828cf01b7c096042",
         intel:        "9e7426a18ae50cc17e2478ff878b426e661ddb83ad20093dde5b418225e0eb25",
         arm64_linux:  "ea34464f481a00057b196a5e616a026fd66a53ecbe9c893ee240d185c9cb9a71",
         x86_64_linux: "b398f7fd383e10c0a26224e63a8cb0204001725ad7fdf6b62ab693be8d19c142"

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
