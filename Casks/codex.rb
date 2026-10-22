cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.10"
  sha256 arm:          "d19486780db4b266107e043fe7ea24c9ed6ec03f4e403552f3a08e9a5f76ce77",
         intel:        "0f1b58869c6edcecb6ff812307a81e5cf2158893d70e3a119132ece04fbdf22b",
         arm64_linux:  "caa39cd4ec689717ba4608eaf5adb6fe25d56425625f72b8480427b3c698954f",
         x86_64_linux: "fce462e53cc1c3b2e39507e4b6d2a3355d849d62f45c861a20c83f5940a32e2a"

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
