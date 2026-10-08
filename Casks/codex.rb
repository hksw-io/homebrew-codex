cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.20"
  sha256 arm:          "b56f76fe460b05caec62883909d5d8c63004361e6ccb0971a8c710a4574e703f",
         intel:        "18661cd851ae2a16f71518287471c0835f483b47a0d3ed62abbdcaa9a79bdf50",
         arm64_linux:  "a772aade452055ed57eba47879b043d7f4d5c52ce4d3db9410e53fe652ac3b67",
         x86_64_linux: "b25e2fcff90da7c9fc4d57d5fec69e8229ed46d5d5f6c4d773b48228e0a08faa"

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
