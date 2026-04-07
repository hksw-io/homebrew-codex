cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.17"
  sha256 arm:          "760958e2d58c97b0d2b2dc1e2915281c10c014789a96708a3693796e1506e36e",
         intel:        "f4e9691a725104e31a6d81e2d54fb1b4670566dc7f3e6ab4dd45d41830970677",
         arm64_linux:  "6a68d58c29ddf47d644bfd62e20185107ba3c86d91c3d94c626e205a4c59d075",
         x86_64_linux: "631282c1f525606a66439ea37d486853160b2bebca7c5d2a1f35084ba5a9a69e"

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
