cask "codex" do
  version "0.137.0"
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
      sha256 "d3841fdb4a07ea5637e320a44918231f86bee29de61cde5935924fef86aff9eb"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin-unsigned.tar.gz"
      binary "codex-aarch64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin-unsigned", "completion", base_name: "codex"
    else
      sha256 "dd493bbf65200ac0cd19fcc01e108d05fc50e99412151e96c7a6e42b4ceaf86f"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin-unsigned.tar.gz"
      binary "codex-x86_64-apple-darwin-unsigned", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin-unsigned", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "1b9cae96e27f5da2752054a5bba9204d486939ea60c65df4ba4a638458734bda"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "d96e88313b95597e9cbb8704f6db16dbb81c07142b08cfb628479ab433696931"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
