cask "codex" do
  version "0.134.0-alpha.3"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  if OS.mac?
    if Hardware::CPU.arm?
      sha256 "13b13d02509b204d2ebc6875d92375a6911eec18db0155a17050c5d0b0ea3097"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
    else
      sha256 "2e1892a770c489959e1ac3d2631d6c55a525f062691ae5c755d3eb8d265cd02f"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "527396795c2cfd0153c6fdc3fa5e47c839674b8fc132d55972e0e74bff698310"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
  else
    sha256 "7f4626ee2240ab8967a9b3f74e6395e92215d66ebd2c4b50821a155c00c440af"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
  end

  zap rmdir: "~/.codex"
end
