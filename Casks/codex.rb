cask "codex" do
  version "0.140.0-alpha.11"
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
      sha256 "0c7de67e9115ad0f73b60dd916d68e14a604033db0b19a008735e34e33475fe8"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-aarch64-apple-darwin", "completion", base_name: "codex"
    else
      sha256 "2d20f80f330a02293d991f4ffb1059e39aa3818420f7029850a048a74c1cbe6f"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
      generate_completions_from_executable "codex-x86_64-apple-darwin", "completion", base_name: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "ed472519bba2c86012e9deb2bbc2c468abd03ed244a8ff656e27e37ef17cfcdf"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-aarch64-unknown-linux-musl", "completion", base_name: "codex"
  else
    sha256 "323dd5f54d388163751323ae7bc505c2071cb0021364638f02e86fbc2b9bd47a"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
    generate_completions_from_executable "codex-x86_64-unknown-linux-musl", "completion", base_name: "codex"
  end

  zap rmdir: "~/.codex"
end
