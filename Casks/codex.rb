cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.160.0-alpha.3"
  sha256 arm:          "7ea11f00b83591583e1013911550048dc05117c512159a60e0b3c1968d4c3a55",
         intel:        "81e0c0e5e78ab545178ad437eef6a8f4dd9b2f72b94987d93c9647ee5ff0cea3",
         arm64_linux:  "09bcd9bef4c09b9bdaeecd4fb72f4d3809cda0e416aa553f99f853acb2b073e0",
         x86_64_linux: "e54159a7d34ffdd4ed9c87e1c7a31f04058f4e7a0ec0a81e933f8b3d154ebb8c"

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
