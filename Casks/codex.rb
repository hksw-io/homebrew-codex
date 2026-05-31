cask "codex" do
  version "0.133.0-alpha.1"
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
      sha256 "541bb4a21f0607dbb87dd309e39e55ef3e40fee589700d8e2188bc7501f744ea"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
    else
      sha256 "2e47d2c6db554575b943fa28939f956d64bd3280d52983de60404527ea73cae9"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "b1355e040116dacbc1ef6c49522f24268b859186995fa2c8f87d17b052fce312"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
  else
    sha256 "df037b9beeb437c19ae8bef57ab9fdc57714a5797634b6ae643408e76f3a020b"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
  end

  zap rmdir: "~/.codex"
end
