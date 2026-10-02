cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.6"
  sha256 arm:          "5fd921d50e42125e8f86e6a4b5591da1bb2f822e5e88c7176aa0cdd1fbbdf1ba",
         intel:        "8700661eeb37aee66d3016f4662e0ffd1542fd5aec9f8ec5aa8f5e4c14d97443",
         arm64_linux:  "809016342e157183d50094c650b945c1772f67433b98bbacb53693a0dae208b7",
         x86_64_linux: "90542611999ac7473c39e6f8bad4730cfebe4566f2dc737b70f6b5f3ef0a5486"

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
