cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.10"
  sha256 arm:          "291ccebdef0c612364194987bb06fe3eeb992bc15aeaa2331a04ed550af3ad89",
         intel:        "13cc42178bff5fd8dc801c727b822a5da0cdbe8de85639cd7059cbedf1e8f43b",
         arm64_linux:  "f960aea7e65ed7a3407b762f0374315834ac8ab5ca8727ae573e55094f6a07ab",
         x86_64_linux: "6e1abd9e9c069b91a0a3adb330682dcb12531dc825124ed3a6b8b5b8857f5f95"

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
