cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.116.0-alpha.9"
  sha256 arm:          "b392bf0b3f24510c234300b48ec72aa0d969b6c1efb98658d74c29bf18825e1f",
         intel:        "3735f332447718c38f7c7a09a74d7f23e302eb8589a4721ea3f3f1d851ffe3f6",
         arm64_linux:  "0a06ae61daf0e87ff8613921b28129b07870185b47f797194a4dd3a8704b4cae",
         x86_64_linux: "da3970b368ffd5c2813ceeb61e643930a877670055b3a0e69b216ec460bd00e5"

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
