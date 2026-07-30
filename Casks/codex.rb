cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.12"
  sha256 arm:          "e8ffab12e840f45cfb0dc02f4b001e6bb2907b6fdc367ac06569b37e74c17e7b",
         intel:        "8b3a370c3828fa868aabafd0e4c733f15d6b3f4d46d5c37e9f851f97092b4529",
         arm64_linux:  "6e985353b3879c427eb414f443b64f5726e544342138df9412b260aa6052170f",
         x86_64_linux: "dc453e50888df3e558d9670e34af8f26c410b564273e993e6009077a40982335"

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
