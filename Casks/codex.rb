cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.16"
  sha256 arm:          "d3548cdadeda78705379e0b0743ca61cb4ad79412609fa73c7ac257bab39f1b6",
         intel:        "feb7f5c97fd321987a27fcd88cb191700c23aff14d654c54eb3617d97d8df797",
         arm64_linux:  "a855236e5e5b27061eb093a0fc57a74087762783abaf29b097ab4d47fbb2a604",
         x86_64_linux: "53fbc472f11b200fb515a1700013448fdf5125e48926eed2216ed176de5255d8"

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
