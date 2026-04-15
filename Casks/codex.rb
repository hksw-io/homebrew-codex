cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.13"
  sha256 arm:          "0368621330fb646d8f7ebc93ca20a2539de3351f7d6e924fdd42c5718e16cb84",
         intel:        "3815e5906f0c764be276aa4054bbf8cad0f49b73096f7236c459f6d606f1c023",
         arm64_linux:  "5cd0c255bafdda7d966044ea1c3212858391783c2b35a85670bc4da3933c75d4",
         x86_64_linux: "ccd7e7831bbbea1ff747cd16a80cb01063d2fbba87a18c9d112ac4950f236fbc"

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
