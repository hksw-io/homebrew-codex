cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.13"
  sha256 arm:          "4b02c65fc27b065ffd077b5eb8ca2592c4bf6d0b184f6c720b9f8937efa68419",
         intel:        "c394362d7d5bce95fa7821d7b29b17db4c2204f966a765b8158971edd122cb9b",
         arm64_linux:  "3b5775580815dda26acd834f967e9b5190b3d5178cc4a74748c5b45e3570d08a",
         x86_64_linux: "ee7aab19ae68e00b6d58ca03c8039967fcfb625f0f17bcbc637cda1a49ecc28d"

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
