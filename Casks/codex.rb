cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.3"
  sha256 arm:          "d090e968c695459b9f84182d6aee2bcb92a4de698a45e03e27a350782a4ee142",
         intel:        "7aadb299b91f0b14dfa47cf92ea3076bf5ad30415f11a626f02ab48a85701c14",
         arm64_linux:  "82e8e3cbbd7fcbea0cdb445389b927da034f3232acd74d068a3b790061044dc1",
         x86_64_linux: "885fd440465cdc4c40ebb81cf991e0a34afc0f56275c12a1096cd50df05efab2"

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
