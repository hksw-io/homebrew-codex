cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.168.0-alpha.2"
  sha256 arm:          "4cdac7e70a8da55681e5d027a8c2b147578afa32e4f6d73df7c1a0e3cf93bf02",
         intel:        "8ae1041e6f9f948bcacc68b59a0d9bd5dae15b7ca38407e06b9524de6c7f61d9",
         arm64_linux:  "b322e5e6a9bd5f8195f00d9761a40c5da38e95407ef259c30e38052404d84620",
         x86_64_linux: "62037680bdc4bb5a30d3bc482eb94fa02dea95c3ef6dbe9fb0282467cd6f67aa"

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
