cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.172.0-alpha.1"
  sha256 arm:          "41776e378828bf4aa9c7f0e761a8a87b24d1da75facc186bdbaa9403582ef30c",
         intel:        "8f482e0b3a63c7403c5e548bcb46ba8bfd7f37a518f38d0ae5bcd1bbb9fe989f",
         arm64_linux:  "a420bb01e7d204b58888b7c54ac656e382180c6c8380fc464f50b3163d2df4b4",
         x86_64_linux: "08884134248204ddac1214682c603f9f5d4bbd0652983c0bea2f01d54ab7007c"

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
