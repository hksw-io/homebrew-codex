cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.7"
  sha256 arm:          "eba39da5d998e66b16d8fda58f7de92b396000ce6dab0856fcba1e35600e4913",
         intel:        "363ff2e721147413e0deca1318fa482c6056157da0214bc45f5a0fa772dfbbb7",
         arm64_linux:  "02104c27a1738f89dca71aaca3f2be43c804ac0e54c347404201c2f988bedbfa",
         x86_64_linux: "c03d67b255463f63f304f40f3abb33686916d054d3449ce940b7efa6637aa695"

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
