cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.149.0-alpha.2"
  sha256 arm:          "3ae3316fcb829936de3651ff0e6fd183cd9f2c93ed7da7b36fba91333317b150",
         intel:        "05f88721cc50972008271b04c09a8e4955779117a7065fd3c29feb68df5201f3",
         arm64_linux:  "6c869d2bf67c334fde49bf61823b9f6c69a13da801895c19dd797a725934c4cb",
         x86_64_linux: "59c8d2c9bbf772e843687aa896243a2d00389705f1aefd48a0a56420de5a2812"

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
