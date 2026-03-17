cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.4"
  sha256 arm:          "fdaf05c041e30ed23b824b723afa894b34cb4b0e4b1262a64d7f361e37307660",
         intel:        "6667f4ecc231f7d024b57a8606983ed3e3d1a7df567391d7c58369fb57323801",
         arm64_linux:  "d7c96149f337945486a3cae527766d96334c337a0e55f2b9ef366f4bea1c21af",
         x86_64_linux: "bd54657e374cc8fa0b7845fc11db05d119287f506d4e5c1af7b85be6670f34be"

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
