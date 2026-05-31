cask "codex" do
  version "0.134.0-alpha.2"
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
      sha256 "7328139bd21cbae9bf48c921452b29d18bb3499867969e501b59f6b648d58264"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
    else
      sha256 "0859fa258494183fc8db36cfd5f0e5684455dfabe2a976d0ecfcc1331e399360"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "4042fa74b29173ef2030a1280389d7610f1c751590df600cfc694dce98fa6eed"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
  else
    sha256 "ad1e0727fb39020ce1060e337605db9bce37feed92cfe548a6c95af625167aea"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
  end

  zap rmdir: "~/.codex"
end
