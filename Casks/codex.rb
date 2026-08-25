cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.11"
  sha256 arm:          "d68452607b6780385156e3efbe1c98a1764f3a090284e920c75ab02cfb17da52",
         intel:        "384618544d9e4869bf5f90efbb4201d3eaceebdb3f64e4cbefc04f2e03759838",
         arm64_linux:  "1434ec9f1bcfb2520c356ace93aaeb7ff9b82e0c22c54a1793695f28bd875477",
         x86_64_linux: "181a5963288f2d573d078de03bf70fef35859cee44b5e1919f0dddfdd7dafc6b"

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
