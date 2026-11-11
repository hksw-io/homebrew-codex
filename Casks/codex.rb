cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.170.0-alpha.1"
  sha256 arm:          "e8a22b6cd58d18353bbeb6cfcd1e806eb24f54d42efaa7d683073773fe37ca97",
         intel:        "c0c934d099018c6d25047272d353378b97a3ee6af94c1aeb5a106c8331d544e4",
         arm64_linux:  "253bb7dab464c621416578daafc027bb2ed528f9efa77cae9a0430b340c12f88",
         x86_64_linux: "51c868ac16432558783147a4e5540c21fb70531ed4240c6d711bfafa809cdc2c"

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
