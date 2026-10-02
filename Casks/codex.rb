cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.9"
  sha256 arm:          "bd83ca6b8b44a35a40e76176bb721de1e0a1b1943625a68c8035bdb7ede197a1",
         intel:        "6cc81a9486a0edeae77dba08267f699ff50f14c6acd072158450cf8656b0ac51",
         arm64_linux:  "68783fef107fbe6a1402ee393d77bb0c848488dce45163762ac1d37dcf7273f5",
         x86_64_linux: "69a28cfb67b0858220fe17932c561952e6470ea05be3b0033df2fd3efb1e3fb1"

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
