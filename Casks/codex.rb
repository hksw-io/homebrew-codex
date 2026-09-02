cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.153.0-alpha.6"
  sha256 arm:          "fa93a1ad8101a636e8a5d72f259f92415e95af97bd0841c385afc524c6744e6d",
         intel:        "bdc8ea2f0c96ab7a657bf1073a72a77dcc009855408b2560397965bbdebdffec",
         arm64_linux:  "3bcfeb54109d61210e3433643c040f5be2bd56e567ffc82603dcd52de9a3185e",
         x86_64_linux: "8b76f0195ee81898d7fac0ef7e351dbbe99cd520a0e3facf9fdc2bfaf24c68e6"

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
