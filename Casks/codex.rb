cask "codex" do
  version "0.137.0-alpha.4"
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
      sha256 "af448f8acef37280635d5ff1cd0848d0f59eb0a480616af0373b6464bea16089"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin-unsigned.tar.gz"
      binary "codex-aarch64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin-unsigned", "completion", base_name: "codex"
    else
      sha256 "2ac771369ceae822d2edf83da2adb764a52b4090bcada943e70ef132ded6de9b"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin-unsigned.tar.gz"
      binary "codex-x86_64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin-unsigned", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "86ef5c87aa6bde4c9627b56f3edd7b042a6f854a13620ca547c341169d864a22"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "850b164030a703250fd13e3da7371d76e6980d4ae7c5199716fe556051125f84"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
