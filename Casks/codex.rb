cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.152.0-alpha.7.2"
  sha256 arm:          "d3408299f0bb13af26c2867b9f3eff01b38608f709ff28403f6f387633ff0c9d",
         intel:        "e0d7b6335b9f74769deeb7c3d91ae791b8af75c936fec8316cd6264504dfb9a4",
         arm64_linux:  "c5729089f084bcde5f1d732664bd73eb2984bb24d1f153a5f06d5cbc2c43421b",
         x86_64_linux: "5c3d3e12c6c2efb9613b2d9c889623743aa30358bcf3dc133f23aefb32759fb5"

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
