cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.18"
  sha256 arm:          "6bef4691e855223dcf5870dec0463f841102753b1eaee7e74037ea37d2d1668d",
         intel:        "d5ec71847b1f5e6a7e50c9edd96d1c5ddae644dcc4eba465f7afe4d0fa6fb894",
         arm64_linux:  "b40e03ca90ce95840fc8587c74542c09c37689dac64fc2db6aebb9124bad63b2",
         x86_64_linux: "cd0fe9b3bee4379d54d210d9e9254fb54c1bfaff1a24b03fe6ae8c7abde88180"

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
