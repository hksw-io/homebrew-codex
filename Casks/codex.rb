cask "codex" do
  version "0.136.0-alpha.2"
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
      sha256 "f8e7082cca5d5887eed3ddb9d93b7af8f0ed4bc11b67efd79eab8fb4f5a3b95b"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin-unsigned.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin", "completion", base_name: "codex"
    else
      sha256 "66b1a767665ebaf996d08a306011ad8e878b4f0c76a899cf0179bc81802dabab"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin-unsigned.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "d50ea0b63538c1564de3e2470e124c8b6bc382dd39be41988e4f745ca11a41aa"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "5f54f16e72193021d232cb499f0b9037a3d8840e68743316e027fa33937b098c"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
