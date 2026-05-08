cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.130.0-alpha.10"
  sha256 arm:          "dec8f2e6fffc44951986fcf53e73ed9f3da7ee3d73245dc71d986f9b1b22b948",
         intel:        "96b0a10b98110d0f71a80d6a03ba6bbe75f25f4f221f7e4642b6f2aabaef5bd0",
         arm64_linux:  "922e3a4d95087e3a1c73845d7bc446c366d0028488f07ea662d9cf548f78aa7d",
         x86_64_linux: "73e806dfb791b93d377eb9a0f1efb682e2aa009283294721f3b5d6c3b97a4f85"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
