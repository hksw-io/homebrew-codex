cask "codex" do
  version "0.146.0-alpha.5"
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
      sha256 "506a6c331e44c07a5f6b876de8fd0c34a43378deb36b9b8d2da7b5ff8faf9b5b"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-apple-darwin.tar.gz"
    else
      sha256 "8441d4aed5c82d9b83d8d079f671801f7bb8da393ad694af9621952a3a4c880f"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-apple-darwin.tar.gz"
    end
  elsif Hardware::CPU.arm?
    sha256 "cf91655cdcf6e03a12172360e7daae0c702a2c9f5f30a044d59c6071584e7057"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-unknown-linux-musl.tar.gz"
  else
    sha256 "f0f6d04d93a5f073954d1389868aad48ff6abacb8b435838a2c0d16b2864d19d"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-unknown-linux-musl.tar.gz"
  end

  binary "bin/codex"
  binary "bin/codex-code-mode-host"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
