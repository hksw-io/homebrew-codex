cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.10"
  sha256 arm:          "5d173771d27110f0a223ebc68c08b673f370a1de279ec79462fa9ad75e1fc745",
         intel:        "795a685f73ea908e4311de63a88c75e9059e6213464bfa4ac3afbe9844477b2d",
         arm64_linux:  "ea74d28adb30518bd0c2a25b5f62a199b01d96f15a69fece09a41c52ee95ee62",
         x86_64_linux: "1c3e5ff552ded738012c2f15c2e21d265032260750e7e8cfcc6af7d93c6a87dc"

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
