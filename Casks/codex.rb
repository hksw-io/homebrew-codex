cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.2"
  sha256 arm:          "67382d077b71c3cb154438a96a3911f448d75423ea7edae416972510f439470d",
         intel:        "f91ce7115639d684ee1daccca6c44dd84f6cb61e05104c77216493c92c819f34",
         arm64_linux:  "d7363bae23f308a9355758e6aad851693d175b26c93c002a9a71b165486ff697",
         x86_64_linux: "b7e0fa3cc03b209570cce6115154cacb757a5a2385931f5e16e6bfe7e1766218"

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
