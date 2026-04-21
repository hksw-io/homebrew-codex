cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.4"
  sha256 arm:          "4b805b018991008e85e9bbb089b87d03fe8cb407439be5bb4cda836e7ef87305",
         intel:        "59cbe7b07b7c214aba2835541aa5bd3783939c0b823056eddd1d7686a818f5de",
         arm64_linux:  "332842dbea766f430b4d90377faea66528918d6f4889b2c171ea6712b3303c80",
         x86_64_linux: "b1fd5f2335832df98ddc7a94cb5f8d472a0d829bdc19c6321f0ed79c21165ada"

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
