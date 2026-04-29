cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.12"
  sha256 arm:          "714d23696eb9dcdf7cbcced6213a756c4cff3e3599f6d57d0a1fba73dba3ed1e",
         intel:        "80026589819713683c53a6a27e78f7aa2851aa02dc6ee96d20e0ca06639c0670",
         arm64_linux:  "d92e405f567394880e46129178b231e2307e38199d654abe9e423cfdaabe8849",
         x86_64_linux: "cffadfc99586368d1cd9661a3ffa6b6deec6c9c27f88fc349f1ac1bcb6505dfa"

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
