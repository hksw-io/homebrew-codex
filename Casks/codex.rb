cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.5"
  sha256 arm:          "5ddad41123ceedb61cd8e7f9fed77a9eca20bc2fe741b1b64edda9e00775156a",
         intel:        "aa54789a9f393118bc25e4c47f80907dcf13e600c53e86188565acd2e031c6eb",
         arm64_linux:  "7c0cd2397a8fa84ab7ab38603fc458ab0aee61af2e0981b57e18898a12476de1",
         x86_64_linux: "d597101cebebd81497030a09e27ea4c803f236e3f126c684a4d89a0d695a404f"

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
