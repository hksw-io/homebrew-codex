cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.7"
  sha256 arm:          "c54a5f7b35a0afcbfb5b040bdb061df10d64fafbf37257e888049ee5b9a71126",
         intel:        "902887fc98f6ccb83babac0368c796c949911a6d3fabee921a647e026de65dae",
         arm64_linux:  "9e49a2e85a2ae5df92b4774d8d9216031559a2b06cff69e037cbc0b45635ed69",
         x86_64_linux: "0991d09b22392dddd475004e1f6773d3c23ef7ed2159f6c28065de4c72f1075d"

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
