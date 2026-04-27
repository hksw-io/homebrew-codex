cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.4"
  sha256 arm:          "7177358d0aed3d6c27ecd4d65c9b1108a6e4396f51a878c522af29e0400032ef",
         intel:        "b16a5e0999ce5342d108a6f61c9320b020cab9391b761be427d04834499160e9",
         arm64_linux:  "f751573a5ec36eaf73c9308a6b1899c7d57a027366cfaa34a7237dcd3c6b28a8",
         x86_64_linux: "734f8217971089f73e6487397b9cc0ee4b30fd19e0e94ccff65144e72b8ebdde"

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
