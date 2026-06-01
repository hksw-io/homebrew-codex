cask "codex" do
  version "0.136.0"
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
      sha256 "b94b06b2760a57c9a3cdd85ab04f078e75492fc882d2d0d94a47211b8250f287"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin-unsigned.tar.gz"
      binary "codex-aarch64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin-unsigned", "completion", base_name: "codex"
    else
      sha256 "97024d5db3947f86a6c602ca15cbbbe6e5b921a6fb40a7728c804cb5c677fdb2"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin-unsigned.tar.gz"
      binary "codex-x86_64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin-unsigned", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "9dba0b8054541854b3cc3c12c25f52d6a441c90d87520e5260df56c09ba3eace"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "dadad6c9db74500ad5431fa178b30288fdbdda6bdf3397634db6e1f5981321cf"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
