cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.7"
  sha256 arm:          "1efac14cedc8421177780afde9241a433e6d9e1dcce76e00a0d15d320581a3bc",
         intel:        "f6e3a5c42fb03c1e4484932ae6f5a16e8f4cd90b9454b3a57a4ffaf4ddf449f9",
         arm64_linux:  "eeead9f18a4097dd2c93182a54d170e02e310f7cee88f0db00d9a599b4d2e761",
         x86_64_linux: "422ae1a8e8c7679031a8d009d3b3d0ee8724ee10412fca334020892aebfc5012"

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
