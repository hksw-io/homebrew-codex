cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.23"
  sha256 arm:          "9ff01a3f76e0c17e2db74d47181b8135215ffbe313e54e433abdf6f3fa708974",
         intel:        "13325cfc2f7f138672e9401c2e65adf3e12fd3be775baf7eaf09a975f14167e9",
         arm64_linux:  "875091d68bf966dbe3bd8f6f8ac9135f5b498b4a75076b53d54608e1431d5c1f",
         x86_64_linux: "ada2b252ebf621c4bfc678e8ce7c8dcc2e54ab8070db32e2bacfe36e4bcaeb18"

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
