cask "codex" do
  version "0.135.0"
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
      sha256 "bfee529ae8eb685214c8aab661d8d6b439b32365d2cbf9d50521cd6996d4b33c"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
    else
      sha256 "7e26af0c4514ee65c6f8374984b42b6fe3f7cf69732b62305f85f2c27cbdc6e5"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "568bce1d593ef25ffdf5549369a8606085652294646a5c4961547a894ea2f76d"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
  else
    sha256 "a15e7dad657da4a0e120eede29556fee6d50e8c919759cc2ecba3c99099363e2"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
  end

  zap rmdir: "~/.codex"
end
