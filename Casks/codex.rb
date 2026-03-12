cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.12"
  sha256 arm:          "022d8f327894957795a06bbd396a257514cb3b8bb5c3e6bfd244f819c7195f3e",
         intel:        "7ce6ea0b99f409c8a0353e907f7607c66fcf6fc72084fd05b75f01efb909d359",
         arm64_linux:  "3f65399741362a2a5bb133944ff42d49a0620e882365b44bb1534f3834d29f56",
         x86_64_linux: "d46465f39bb66b09b241e70b375524593819f2789638ce6d5781e75651b31459"

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
