cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.2"
  sha256 arm:          "72c14caf0ee818838b4d42a65591ee9e4add79a28d5991e2fb5fa7715e06c544",
         intel:        "69302a27cdc230e9054c20f98b52d92763649a862012ae15f6a5f9961d27edb3",
         arm64_linux:  "7b81551bba8aebfb836c85103dbd9cb3f181d94cbe86e0d7d1f6ea9324902efe",
         x86_64_linux: "679caa80315c126a8b2118fb76b3795268dc2592f501dd4ecc44f6861c44477f"

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
