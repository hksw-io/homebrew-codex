cask "codex" do
  version "0.143.0-alpha.9"
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
      sha256 "eb02fc18e3e5d63edd8858949cf32de85f2b35a4f0779ba2b6529f5dd67a571e"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin", "completion", base_name: "codex"
    else
      sha256 "f25a899a059be1d8e90ab24ca61cc16f9ab0a3318f171e4dec5437cd7fe2d582"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "8a60b7ad85321199a23da7a4347262b683501b2b1d46f7b9a743422cac806c96"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "12f16ab2fb5a436b0fa814e4a04d32b0364b723e0e93fc727d4d3743e29f4c26"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
