cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.4"
  sha256 arm:          "5f4df9c74d47be886ced25862deb6cbe0ded6596946f162400dc53798e552f95",
         intel:        "1b3d27b9c8024912a1fdf54edaed99ff922926d0d35195e4c8b4e2615d7ac856",
         arm64_linux:  "e191b79e7abd97d5ca077a00d6769f7ff818e6f7667e4a5d439c604dd2508ff1",
         x86_64_linux: "af6553aae1e8c828f840989c86a7308a3b12cd09eea5c5af8b11d7bae044b115"

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
