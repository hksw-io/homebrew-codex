cask "codex" do
  version "0.145.0-alpha.27"
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
      sha256 "b8916655a3656bd92b4065109bbe52cf42b6883f6fe11589e86442e6b00fd7b8"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-apple-darwin.tar.gz"
    else
      sha256 "4ffe2020e2b60fbaf4ce02df1bb88e54bd9aca013d2dcf8cb625222c7852064e"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-apple-darwin.tar.gz"
    end
  elsif Hardware::CPU.arm?
    sha256 "c492a628fc90cb517c167cd54f6d130766764b76e9c95a2307a69163fd9abd8d"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-unknown-linux-musl.tar.gz"
  else
    sha256 "a1801a2c19b120e105647a0bfd5a5b419d507a5dea49fa6039b58d780b1c0ff9"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-unknown-linux-musl.tar.gz"
  end

  binary "bin/codex"
  binary "bin/codex-code-mode-host"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
