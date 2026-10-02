cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.1"
  sha256 arm:          "c1bf7a78127fbb1d232b7806b2651b65993ad128dfeda34d5edfb03d3d9e43bb",
         intel:        "530cdcc69f68c443a3618f67b75077d94723b9045c2c32156b07daeda6b43e76",
         arm64_linux:  "66905e4b81c0298fe1179308a5a876bef91fc2f909d89ed5cc309c28573d5af4",
         x86_64_linux: "311398b293c5e2ad4b71fe50475f29c1a443f9f56ccbaa08236cc4ec54a8ea7b"

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
