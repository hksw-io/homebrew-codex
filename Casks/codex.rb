cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.1"
  sha256 arm:          "ac1e39deed05db1114f3e079332c2df1d441a7b64530ee7d0b450af5a95cb800",
         intel:        "9d3ed1ea024195198811df35010bd5e6c3c46063409fb4c6aa929387c9c162e1",
         arm64_linux:  "b8f2ab1f78515e67f5ffb7a201069bbc8487df92be1109c0eee0a8ca6fe59592",
         x86_64_linux: "579da63a258e731a34173a9f0dcb69aef3f87cc9240f0ee637b5249f652ab419"

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
