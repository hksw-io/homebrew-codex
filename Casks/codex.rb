cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.11"
  sha256 arm:          "9a93c685c98b075673a20d748af036b531a19d80e0819fad18d639125766608f",
         intel:        "7f18ac0342ad24338984c0a61387b9b076c39f4bb478c6f2ea674c9e5483ee69",
         arm64_linux:  "74858a4676bae57de2bcafee19372c78d4184c5a6644d2d0bb6adc1a63a59f0a",
         x86_64_linux: "85164a20b1b0a7494da21b801ce88848fb533a47318476c18762e92f7e259084"

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
