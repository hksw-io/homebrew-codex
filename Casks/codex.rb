cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.8"
  sha256 arm:          "8de69695d0187ff1b5cb993790a652bb6d051c6b7d52d648f6d9f79466d7fbdf",
         intel:        "e0287850fafe7cd0b7bd074e2f7cd8a3ccdeb0becf1256f4514697f304c8aa3c",
         arm64_linux:  "f0891e88bccad54de3358fc69faa3d3e76d64637461600fe7efd9fdfb4beab4a",
         x86_64_linux: "7012ccb407999875401aab841b90edccb85593b52d62a10da32138467c03deb9"

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
