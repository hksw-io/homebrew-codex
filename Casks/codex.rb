cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.11"
  sha256 arm:          "2c8d5974e5d52dee6bd7357fc514bc44aba7cee5477ca817ccea13b988c44946",
         intel:        "714bbc77e49ab54d36a95d8154a0d97a6033b93276e472d1a6e053915d52c73d",
         arm64_linux:  "a083a7ba41a36ce14d1a9d649507d300962a1cc5fcf6330b01588922f1289716",
         x86_64_linux: "de97f094d55851e4b2410e6dabe545e02b4f32959fdfd0bb0d29f256b1884c51"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-[0-9a-z-]+(?:\.[0-9a-z-]+)*)?(?:\+[0-9a-z-]+(?:\.[0-9a-z-]+)*)?)$/i)
    strategy :github_releases
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
