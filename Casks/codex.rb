cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.3"
  sha256 arm:          "95a5f61fc7c97ccb98ebb6c434dc7af2c1fa22bf44b52e3f208fcfa1af768612",
         intel:        "fb773d3b0a7dd056ce9a46aa3dd589c8440deb37879d1f419f077bf3f98c294f",
         arm64_linux:  "6aab558fb9cd44d83eb282cb1ba7a9cfda39f4d3807132d097b1f4c1be9e09a2",
         x86_64_linux: "b94fa757e15358d0d74d64141eac688667502cf8076045506242edb83ae78cd6"

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
