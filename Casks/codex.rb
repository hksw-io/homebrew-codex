cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.7"
  sha256 arm:          "ff5624c0fad8fed53af21aa1a95bfc1506513efe3af7ef56af964a63c4f72b0b",
         intel:        "0899ab5700ccbbefb23953fcbb9f5a5752d26612b47342ff86060ad8aa09e346",
         arm64_linux:  "9f4c846e29ebbb55394e25f3cd41670647031af41b422a2e64f62165ee09c396",
         x86_64_linux: "91fbc960210daae8e0bb4194c012d42e5039496fbe6fea907cfa427697b6f796"

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
