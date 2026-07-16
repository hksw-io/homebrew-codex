cask "codex" do
  version "0.145.0-alpha.15"
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
      sha256 "2e7159ecc697851fcab2836a98e3cfb37c460a805c1ea53f8fc4c4f70b010c4a"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-apple-darwin.tar.gz"
    else
      sha256 "e3e93c7aba44097963b6496cf1257111f0fba6aa33d91323e340b1498d5ee080"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-apple-darwin.tar.gz"
    end
  elsif Hardware::CPU.arm?
    sha256 "ec7b90aee17b50d89cf35152ee135156e6821a37f9eb48b6e5423fed3a2af8a1"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-unknown-linux-musl.tar.gz"
  else
    sha256 "338b887e83a3212532f7a5281031f60f4ae8198b912bb2b4ab031d8822d604c6"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-unknown-linux-musl.tar.gz"
  end

  binary "bin/codex"
  binary "bin/codex-code-mode-host"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
