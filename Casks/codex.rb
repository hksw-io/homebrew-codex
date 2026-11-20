cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.173.0-alpha.1"
  sha256 arm:          "611b4fedf395642c0b1d658692ff7118e47c20ad31160742f1249eacdc629908",
         intel:        "65b5564d000c7c659fadd65e9d53a99c5115ff9626a84ffc6f59af5253693ab7",
         arm64_linux:  "3b226729e16adf8487aa47052db2dcf40969860fddb122845f79fe1d5b4d3a32",
         x86_64_linux: "02b360514e33943e8a0b0e532d0b20b57bd14bbfd4d78e1b04f8610fbf263977"

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
