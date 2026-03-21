cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.8"
  sha256 arm:          "61a3b1398d10c0b3330a615eba25630a9c817c2e1ace6690d6739f97726e9ce0",
         intel:        "a0595638be6f95b21b95629e28362a276d7c0479bc4dbd289f5c5bc2131218c1",
         arm64_linux:  "b779f3d54bb2bc95d3c132dab96078851bfd366a368361c51a75d19ca906ea86",
         x86_64_linux: "56b40571cbb475ce082c0dbfb681da08abc0821a949bba21ed40d5d2414bd787"

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
