cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.8"
  sha256 arm:          "0a21b28f211158797c90315a28509c8a90564e2e49ae3a10ac662da35c4001d8",
         intel:        "d5f2c306ead07ec23227bf874c69964d013d088b82d9d58b699c9c2a5faa1cd7",
         arm64_linux:  "5b95523d3dbd1ed52a08b262ce44106cec7ffa3c84cc102dcf29fc5b936fa63d",
         x86_64_linux: "21c5c5404f9aef329b386f63f3feeaae5961e9d9fb9004c660093a88b04bf4d0"

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
