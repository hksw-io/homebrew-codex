cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.14"
  sha256 arm:          "187d47d16b9ef85115d59a615e534efc1642e0416690ef61bd177b3319fd0870",
         intel:        "af58f41468590a749a7d52c6526bca7f65e8d447a477f1aad075d18b76e2416f",
         arm64_linux:  "99bfab1a85a793d964bbde36a435b1875c193ec299b31add5857b1beeb0a9a38",
         x86_64_linux: "2fceb884f31dcd1c3a92b5d376987eb888cd9e5b071c4125ae64e30d2c455c31"

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
