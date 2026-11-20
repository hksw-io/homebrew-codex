cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.173.0-alpha.2"
  sha256 arm:          "3ae92d608674ee090b0849d16ca28f1a9de6f5df5bddedbf8b51e545434c97d9",
         intel:        "8a3267cb4111f247e330cf2bad0fccaded99565b3bca3380e3fd30eb738a0bd6",
         arm64_linux:  "da86366769dcbcf139c01577fbf54a6a45928cb9c118b0a2b60a9611870d3a7f",
         x86_64_linux: "e85f6dfbba3f8be2801eb5dd5f5bc81ab564973e86e5221bb0382b65f537dfce"

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
