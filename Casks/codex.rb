cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.124.0-alpha.3"
  sha256 arm:          "38c8ef6dc0e174e603307513a737582035b3122100d36b719b097ed76e638319",
         intel:        "90dd2eb9a857a8a7e77e417bf104515bbde4ffb1e01aacc8f5f34085d53aa274",
         arm64_linux:  "b41addc6368cdb647fec810e42b567c9f70649840e5def5eb01c0c87ff4f4bb6",
         x86_64_linux: "c824663fd8afb70892de1e5ea6eb27a585120dd4c19920e791d60fd283a387b7"

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
