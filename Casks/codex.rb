cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.18"
  sha256 arm:          "8c7453656dbbdcfa15f28865c7c1901863a9949e8e5d067e84c1b5075acd7104",
         intel:        "13157841d1b1981f804178fe8ec69d574c797465ac5d8e7bae92e35539f891a2",
         arm64_linux:  "f1478c26ce465783c59aec137d5e0723e0628db85b1844e3be953bb91f4815d5",
         x86_64_linux: "caf2074a8479940895706d4ba5079c51cf3df652bb6a8d52b3ac6346fbf34837"

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
