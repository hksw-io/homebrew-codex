cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.10.1"
  sha256 arm:          "73d2acd5a0c97b9b01ef13f1205f1eb37f5a11811d0bd8ba33d63ae1c8fcf970",
         intel:        "675f54b46f89efdffe8ea55b3ce184cd37385ff18853338315253bd850172dc9",
         arm64_linux:  "47cbb5deba5574696c0b986a68f83d85a8df7c74c761cf86c86683e5568bdab4",
         x86_64_linux: "e165da2176093f6c40e22593a31da038c8378006d963bbe1de698b53e88886ee"

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
