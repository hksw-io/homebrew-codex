cask "codex" do
  version "0.140.0-alpha.16"
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
      sha256 "26fca44ad40ed7a57dade998e6707f50d6c9c58b6ffa43e3ba56c5bccb29bf43"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin", "completion", base_name: "codex"
    else
      sha256 "ff61c5624e7a995287ee60f324cb7229d99ec70b4c781ce59c1e4e6dab5275e2"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "0c9c7117fe4b15ba8f7847bffadb2bf0c063520f9485b3279b954e891b200239"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "5927e95ea8fb7f6558be17e6ce97f6255a7197b4df7259b4231d6f61b2d9639b"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
