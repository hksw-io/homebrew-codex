cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.8"
  sha256 arm:          "ca2e8010f7a5a8eae2d4d0393b5a6c28b84269a8405a9b651a22d9e20359ee12",
         intel:        "953aa43d117ac47eabc0cc139340cea47fe50667f452e9538ac9a20e3ab71729",
         arm64_linux:  "29072d02e98ceb9bb6c9f0627dc43e547dd7fd7adbcd0f4a8fb16743681bd704",
         x86_64_linux: "eef00e1e11343d342017c772a1b4162462a65039621d27fc300add398d6419b9"

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
