cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.4"
  sha256 arm:          "81a3053087af25da5d5738c0ebce94180fd294cbc13f92e29e7315a4ffa5ed96",
         intel:        "5d5b3e415a5396774d6c3136630ed94623c4469f6498b4a08a6aa3fbe8bbd487",
         arm64_linux:  "5bd4934baf8bdaac94874783ce7e1a8bfd9d09f8fd4ed5162b85662ef21632ba",
         x86_64_linux: "986ea20dce154dfa1148eb1b787c2e271a460ccd345bcd21a476145ec621361e"

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
