cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.5"
  sha256 arm:          "e47ed5ee5792defd44b81a93044cb76b77f94917032fc39ae4b477cdac97aa3c",
         intel:        "dbd7e63b9b7ff4522686a5c295fb0958ab67d76477a3ed28baeaff67aec021da",
         arm64_linux:  "067ac4c791cf30a385b7ead4a3dd161fa5b3af15da5f28171df0e88d852a3f65",
         x86_64_linux: "be12fc585c7e9ecbcf9ca54f67ad11047435bfe73c8c423e4547241129e2ff37"

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
