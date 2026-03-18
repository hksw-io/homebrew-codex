cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.6"
  sha256 arm:          "63a7b231621dc25a682b88374cc539231910072f6ed97472ce50cc8591f4d904",
         intel:        "f513f59aa91f5e2c9b4221856b19739ce87ab0d89a2469d7fc68d4f68529a37d",
         arm64_linux:  "2da96f3ff439891c7bebee01a1fef8d5ddabf8e2b727e98abcbc07a7e1be96d9",
         x86_64_linux: "88cffa31e554f4ea6fa5d041ca62ad8281b8361b8bf37623036fa870f8cf54f7"

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
