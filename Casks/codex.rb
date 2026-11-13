cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.1"
  sha256 arm:          "e76b90e9d4d1d8d90f1586e83c3ea07a17128ea982d29588d218e8ed1c80ae79",
         intel:        "1bcda026918410255b852cb1dd0f60b55b5442417680e2efd2e0fe479f3f6e6f",
         arm64_linux:  "f92f68908af1d61a5d53805d647320e492e0a6c48817483c3468fae196f11157",
         x86_64_linux: "14164a0a54172e05ad1ae7985477104348eb6b485643274c0d6446188bd0528f"

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
