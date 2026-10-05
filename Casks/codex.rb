cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.15"
  sha256 arm:          "7d994e155dd3cda3db7420df3dda13652d58c9c644aba174e9e530b32952df8e",
         intel:        "56b0b5e0e29bad4eb5b1df9dcc42daf0a0c2c8f14c7ed4018a1e6b5777fe7edf",
         arm64_linux:  "aa6984677dee103b4213b6ecce325233c14392848319db09698b71cc7b1a08c3",
         x86_64_linux: "21d06658656af5b104b0b8302c3d40f6966a7d35d440096cbe2ac3523e0af1ae"

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
