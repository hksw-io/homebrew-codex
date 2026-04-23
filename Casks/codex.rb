cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.124.0-alpha.2"
  sha256 arm:          "3149bd17cb68ac691927f410f904c58200b9e2799b9fa5320ea787f04c17a7fd",
         intel:        "79cb651f43717f9ad85549788ff8715eb8a32e9fe46acffe99acc37e3d8b7b86",
         arm64_linux:  "b713f225ec22bf282f6b6ffa7a9e05c6a2c87bcbf7c2d87235e2fd2cf8399e18",
         x86_64_linux: "6c2938d37b12faca67e37b1ae30e367a9d94c125dded8ba76ca6bbe7caa0500e"

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
