cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.23"
  sha256 arm:          "ae4c0ecb0278478da16cb73f753f91c32ea6f0231dda44311dec0f2bccd8fa31",
         intel:        "bbcd227633a41dae72c6316d8d9e29f7e9b8deaaabf66d7af801d99905f727ef",
         arm64_linux:  "6f4f1be1b248be66f4d551ff256e3afaf18aabb1a3c8a1392a60037e3aa154a9",
         x86_64_linux: "fe394659e04ee95c9ad5635270f163c26565836fadff6a0bf936b6c87c72c041"

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
