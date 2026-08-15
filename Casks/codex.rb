cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.19"
  sha256 arm:          "befc669467266f9175c8242d19a31ecd49cfe9705d3a21940ca42d74dbe5379d",
         intel:        "e33da3f4cc5c9239b41188221cb22bb8deb71ddf19a4d5319d47c0e07e1e5d63",
         arm64_linux:  "222f2e0467908803406015a7955f372699e9912c8f29f6d2ebfe9a2aad24d390",
         x86_64_linux: "3b10233e96906133652b93518037ef1376151bcc4d6bfb061b0f93d5b97a19f0"

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
