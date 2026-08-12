cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.9"
  sha256 arm:          "9457e165282674ff273b21926db47a9adcc7327869b0109bdc867e65db1a0f4b",
         intel:        "e35efedae12405213063c41d4ca5aefc54f14e1c6ff75e525ea1bbad53b0e8f0",
         arm64_linux:  "524de095b4be4f992da3704b6a48f67acbf796664afc3473b68a58a6f7515f0b",
         x86_64_linux: "d82d031cdb95bad9bb6de2e99ddc805ec35b20cd51906b4bf34b11b6d14c821b"

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
