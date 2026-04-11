cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.120.0-alpha.3"
  sha256 arm:          "5ae1e164e5ce8f61b46040c8441719b1853d338b471a07b57af6ba6f539915ac",
         intel:        "c5c35fe43faedbced94c36aabad00a4f26f2ee50dc0c65d19ae8994b82f487f2",
         arm64_linux:  "63a64a7a663fc3dabe2091ec22f6eeeb1d1db11844c6fa988fad22216ca2f471",
         x86_64_linux: "636b10afb0eb424a7b3f7b422584306a8f6ed4b2c851cb2e9e1c6c5385d6d82f"

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
