cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.8"
  sha256 arm:          "9c5436b26fee7966152a43d9a18e2de9e430301d9585951cc2dfa345ccc08c93",
         intel:        "895c4eeb2f3ddad94896fad41cf0f1a1be93ada9b3e5b0b5acc970e03eeb3d70",
         arm64_linux:  "f16549d330b08b8be523c4308cdcb2afe58a767a5514b43537ded209b8701a69",
         x86_64_linux: "87f972c612b2d2d58d21cda551d64b39d3763db74505044aabb3e95c8debe11f"

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
