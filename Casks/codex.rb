cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.125.0-alpha.1"
  sha256 arm:          "7016836822611b24548dd7ce1f8bb17e0ac239f4e4d68d636a1def8b389a1ddf",
         intel:        "6a9d199307b32cdfe17796321c6a5ca8fe9cb7f2d03210de678c101b79a5e258",
         arm64_linux:  "6dc286ce72028d342464baa364cc35ac69d44815c9783fad9f6e2dc2cd03dc4a",
         x86_64_linux: "27cad9ba72f4a217b0c30a0358591a4ec30d4c610e0c43ee61a2ce0560566e60"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
