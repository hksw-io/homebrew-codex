cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.8"
  sha256 arm:          "5262e8caf709d5df611834af3119992b78b8787c928035adbaf5186d9efdf718",
         intel:        "fefc75fd6808f48d20b93098b7ef1ecf2899394fdd725843660431bb8aec93a2",
         arm64_linux:  "12172b176264f46188a2d281199f38510ca7d3b2b68f5c6d6e9eb3fa9a18f38c",
         x86_64_linux: "113359d9f08c976c7b23b813caea10049e790bd8927d07a82adc71317c608cc2"

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
