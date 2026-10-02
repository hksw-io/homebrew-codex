cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.6"
  sha256 arm:          "75623a98932ccb52d90b10b2dffe104dd8e91070893567a89e351d983ccbc703",
         intel:        "05ed3ab5862d742d30b661b8d62e64aa2223647106ddede96673e8581ba04b19",
         arm64_linux:  "0f4d6058e4593813ae8e65e774fa995eeb450dff33e30b2afcf8aa6a014a19db",
         x86_64_linux: "7aed2b2b5349c235922fe1e31565f64360e8fddb6e3f75e1bb82dd1c990a1b83"

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
