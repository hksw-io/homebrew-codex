cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.10"
  sha256 arm:          "03f376f16b923d9a26eee9e192405e3897dde69292fccae1f507947d958ededf",
         intel:        "5b719b451743c5af606b249fd70cdd34c13b4caf47cea99f036e4b1fb3e71f5c",
         arm64_linux:  "e922a06980c1e2cd265fe0b28247f9a5810db8a69dd136aac36b14d64753f743",
         x86_64_linux: "21fcdc6c112962be5be4ecb920d325a9f5f53836e5eb29811ba66f11bea9e426"

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
