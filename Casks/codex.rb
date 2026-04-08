cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.23"
  sha256 arm:          "3698f8ec89e99e5a55a2110ea71efa0d56632f7a4ccd749ea8ae074eab5895b6",
         intel:        "36341f501ac46792eed01580cbb0535791bbfa9b0743dc0d880892ec3b79d04c",
         arm64_linux:  "aebf5bbe0c31ba9957d6deb4be7eb70c4b0583427465fc25ae1eb0fb7f46c7ef",
         x86_64_linux: "ba98223e9ab04a7b104c492d8a5955cdaa1ec532e81ae3e43108e6e9219eb3bb"

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
