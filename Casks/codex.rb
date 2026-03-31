cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.118.0-alpha.5"
  sha256 arm:          "7945bc0fa52848aca4099ac74eb39729edfdc57ba7a393c8f701d6850ea268da",
         intel:        "04b480d9b9871628404268929cd99f536f86a01df7920fb452a799e031d332b1",
         arm64_linux:  "9ec0d0ebf0f1514314f0a8b4713bb5c89a035d4df5360c8463cfce86ade299ea",
         x86_64_linux: "f2cc4d1d475a5b659758321b5e6f996bb6d8dc244c503b9da9e727d565474e94"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
