cask "codex" do
  version "0.137.0-alpha.5"
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
      sha256 "09ee328ed365188a3af4d4ce5cf6641dc037789681de6025995f3accc291665b"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin-unsigned.tar.gz"
      binary "codex-aarch64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin-unsigned", "completion", base_name: "codex"
    else
      sha256 "a87f27c87e45a0e5b1642f9d97ec91770ff19632147126d754f0704aa7307220"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin-unsigned.tar.gz"
      binary "codex-x86_64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin-unsigned", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "749d2d9bc9dfa8875ab751769dd867ba8827dc34f836a0570347f05dc04f234b"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "20d7b19b0e4674bdfd794d1291427a52e584bcd1eca5180e0fce3310356e5eac"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
