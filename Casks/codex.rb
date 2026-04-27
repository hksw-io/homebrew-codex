cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.7"
  sha256 arm:          "cbfe02e4b3da9a98fb6a49e8ade781a83c477082e607c08500b8b2b1ac4e47f5",
         intel:        "b8ea6ab47ba2eeb767b569a3b10331c14632a5ea548a774749fe846350f7b4dc",
         arm64_linux:  "6f5627a9e5a7cd097ca6123232665404f77f2677d21cf227f0ac228192b32cbe",
         x86_64_linux: "94e633121da26a8b542355174375e9719ba82bee255c9cbaa2a007bb9b64e6a5"

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
