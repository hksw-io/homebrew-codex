cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.10"
  sha256 arm:          "4c4589351f0d20343ba41434c022a04b6b721102654c023dc9a4b4f4b8d2522b",
         intel:        "cc2ff55dd48eed8112e161b15005899c66353e3e7f122fad6883a2e30e646396",
         arm64_linux:  "5525a61a645a18a7ddbd2081cce4382ee98c8ffae9fe387401842d2b81b96882",
         x86_64_linux: "4f5df791c3aedd2e1375806beeea8930bf2b966f28a400e023e519c1594db334"

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
