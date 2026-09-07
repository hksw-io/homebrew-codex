cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.6"
  sha256 arm:          "ae37c70e6c86f1f4248303e084cd03480d8628b74df57649c128730ce4159d50",
         intel:        "453232d91c321d4dedeb0da27d91e2b31ea5bfbe537883287de973d7c2db5a7a",
         arm64_linux:  "7e44833a5452ce94a545b0054e885e1b67b08eee04cd29392ecdc331f12239d7",
         x86_64_linux: "bd0e619c578da00668afc396d918b789e62635a911c4e79b5b5385c4bae2b643"

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
