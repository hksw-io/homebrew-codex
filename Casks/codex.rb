cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.169.0-alpha.7"
  sha256 arm:          "607c57ff9c776804d3771d71fb976a1fb642ae0867a65d13d49129f0c364f9c8",
         intel:        "9f6508fc91cfc774a577cd9a270fe8baa3e8d6c4f01cc8c9efcfd85b282d604c",
         arm64_linux:  "e77d49eefc30b50156ae5249a9fb580def51c958e5a5fa81be4ac7c06fa2aecc",
         x86_64_linux: "2ef4e128cb2cb9592ba73d91c40ca5d512f5fd7f1a60346b903b698f88f63556"

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
