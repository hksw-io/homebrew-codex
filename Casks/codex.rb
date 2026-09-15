cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.7"
  sha256 arm:          "34a133939884215964977177f3444cd83380c0f603d74ce2322a49f0b687346d",
         intel:        "756bcd3ca02eed0d386ada1579040185a3147995801c9a3fa3f43c36e50f9220",
         arm64_linux:  "946e1f94eb7e74606cd3a97002cfb54b8842922e7bbefa122730e6ecd3f218cd",
         x86_64_linux: "ebba83ee62b26c854b18c8c22d4e351a42b67f58a777a26aa24546b24da35557"

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
