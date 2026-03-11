cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.2"
  sha256 arm:          "6bf4f5747e2571afa9ee29f7ed78ea59d5e5d885e33991f2cedf39bc567bef9c",
         intel:        "17c173d8547239345e7ff71d40d2abd66b6de380ae10782661a52a1c7564cf4e",
         arm64_linux:  "76d57cd7c5e40e8314fb9d7b25e4b125edf622386c5e4d5e2ac7a78210dd6471",
         x86_64_linux: "7916a30ae21bb0cb3656889b62b5184f9158afe80a49c4d973d0a36f968a072d"

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
