cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.4"
  sha256 arm:          "9ad626e1c45a155fb4e2c904e9ce3a387fa0bc15f83bbebd6900a1a48232edb7",
         intel:        "5b5ab9fdfb98e04c816825e244d12a6ea747a3723fff80a15eca094409cd6fb5",
         arm64_linux:  "d8ab0e10193fe969e4c4b787a7986208508c401cfd1e8207a871d7949b054855",
         x86_64_linux: "a7547d329365572d8a5a6426bff898ea8cb538575fa5acb3cc2636f0d23c5d22"

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
