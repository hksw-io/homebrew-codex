cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.3"
  sha256 arm:          "25fc654035f37202d28788d107223a1c5b53d0c073d6c79b964d1a9d255f19b8",
         intel:        "76a52bc0628aa9f07ab6f20f70f9da2c4ee22424a64debe64a3768f8b837900c",
         arm64_linux:  "000199b3ed9cd8b27eaead3f810dddb979bdf9e908ac0864432f0ee04fdee801",
         x86_64_linux: "68e2b2f309ad63cdd877f2a5f4acdb82ff63bfd1433771bb0ea68aa464355465"

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
