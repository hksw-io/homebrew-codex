cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.12"
  sha256 arm:          "0e8017398aafc553581e982ca14b60837cf5e538b35cb80c6078454b638b8645",
         intel:        "c176a1859b9853401bddb0878dcdfafc62a6afd02153eecafb9dee6847174ed8",
         arm64_linux:  "8e41aef2163e83bc3a7990d634a546f92f40a1fc134dc82c788c207a09eba557",
         x86_64_linux: "2abee9d9d64192ee84fb1973dadf962b47e3d97d5c0fe95b5d96c73e27228c10"

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
