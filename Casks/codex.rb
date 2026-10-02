cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.7"
  sha256 arm:          "02cfbaf7f61418b37a7344ca8ebd0b74a2ddebd57f0f15b6f14c226e3e9b1641",
         intel:        "1c55835933ffce7494a064eb3f658b755e6db9c1c79b709bae6696d630a66e33",
         arm64_linux:  "3396c2c43dbbeff5080dffdc12d58264a7d29e58ae2a3cce2e026539f0474dc9",
         x86_64_linux: "01668011abab1ce22f505097b667934ba632fb143f1fa01010c5358e81faa3ab"

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
