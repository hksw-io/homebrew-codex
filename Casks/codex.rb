cask "codex" do
  version "0.138.0-alpha.7"
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
      sha256 "ea57da100d647fc0c064c5e6aa5a5c9d75763accdd88f4fadad2f0ca7430de3c"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin", "completion", base_name: "codex"
    else
      sha256 "9fbd9bed22efefa373f51b826a53ed8956d8e940a44a77dc9a9e3ebae206272f"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "12b15672116a8c623f90ecbe393e34791949e9c83bc5346d53db41b13b84f291"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "a273a08960f52a7c5e9405424a4854283b6e231e89b182304ee779bcdfc21a4b"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
