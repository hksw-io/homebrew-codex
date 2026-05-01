cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.2"
  sha256 arm:          "5e94dbb2f2071b97384aa53f1472fcb4eb462516bf5537afbdeb34b9a7873e23",
         intel:        "228007adbbbf86b3d2c79aeb8c7c013172fcf1d057624e5f93922b6e6821ca4d",
         arm64_linux:  "43ce5e8a4ea99abac36691f9e6cb78cac7516f50bdbfa2471b873273df8eebd8",
         x86_64_linux: "de9e01aad3aceba1aeb73cd17ec7c51b0d403d9e6ad4018ddd59c7f518e6f46c"

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
