cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.5"
  sha256 arm:          "2aa994485efa508b29d633f26e1785ad4e32db3436709296a02d10d132b54b65",
         intel:        "27f05d3bce14f0f4fb4fe5f4b8b918d0a1ac4a63cffc04ae6bbbd98fab4e2808",
         arm64_linux:  "ce07e450c1bb267579d99420b4f266197d4dd84db6bd53909b0db8d4e90997c5",
         x86_64_linux: "3ce776b86b3e0a43223d17eb8b6f8906d43f020119098e71d583d14a9e013263"

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
