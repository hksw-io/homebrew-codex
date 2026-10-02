cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.6"
  sha256 arm:          "7627fb7ea2fa4fe206b120b64243e804646101962353c9f06416fc3a1483408f",
         intel:        "9fc0a5e458849da6e566c2ee0386f23a7835ab67d2a75e86025b3886cdeeeacf",
         arm64_linux:  "93eada7171705ae1310d47e668804a25234804ccca1f6b8f38779e71640f7a59",
         x86_64_linux: "4dfbb5d8ae813e9b057b6e286ef6c065056647f0e10fb36b3085c616a57fb3ab"

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
