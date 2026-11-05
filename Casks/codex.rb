cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.168.0-alpha.3"
  sha256 arm:          "5cdbc4301179a93f003c2241e0cd4c5303bc4850d863f8e43d8a6a40756ae1fb",
         intel:        "1cce919fb8d0497b221a4d9abcb4397c01eff9e9e350077434da00fd668cf343",
         arm64_linux:  "761a95809505ed0ccdd21bc81977e31aeaf9aeb5693db5d86b9bf621691bada7",
         x86_64_linux: "ccfadd48a8863f04ab605b15525fe2c7d0d235ae0420299101ab83642ff1628f"

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
