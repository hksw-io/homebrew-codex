cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.5"
  sha256 arm:          "8b2f630381c7b5f02212066be98dc014928ec8d3dbcb9eb7c85306de85ac13d7",
         intel:        "0f4f958a8424e290a1f78bda3b82969f279b41675a78e04b336884e5b28b58b9",
         arm64_linux:  "acd259d2baf0280af7b0eb91d24add86d880533e2b8ddf4b53f78ac31c13fe3f",
         x86_64_linux: "4a5cdf2e7f25a5f3d2dfbad80f07f88801ff3328324255eb3d9324615e13d85c"

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
