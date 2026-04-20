cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.13"
  sha256 arm:          "7e24edc75d8469f3349b070ea4fd8bf0c067bb5403d31c0f381ea4bc60ed917b",
         intel:        "69858183376c6906873e0c2855944e224a7e00ad487e1122c7083ae06abed95d",
         arm64_linux:  "83a1adc1e879ff1777b8a9f8f4f6558770b82f56386618981aeeec12fb31aa93",
         x86_64_linux: "e08d12fa0e33dbd163a66d45064901ee3176bde6d7058e001c3a1b327bf526e0"

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
