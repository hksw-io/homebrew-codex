cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.152.0-alpha.7"
  sha256 arm:          "393a0aeefbf03cef71065d2525f816f67131cd71839d27e49e6bd91523474564",
         intel:        "eb1fe6e6a9a71f78ee1e8389cd4c978205ffd3709da30fdda500cf9f508ce46c",
         arm64_linux:  "d1a778298fb32912707559a445a1a43f6e2af7dc3d7d40e6d8ccb43380e59573",
         x86_64_linux: "89ee6c37769056ab106963d529e1cfe97c388a8490169848aa8f31a7faabe432"

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
