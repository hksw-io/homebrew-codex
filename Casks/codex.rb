cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.4"
  sha256 arm:          "7c8db59e0a97acb0d6c9544a134f728b987fe8c85b841b7cb5e123211705638b",
         intel:        "f38c168c8241dc8b889590cf6a4f90ba37284af2f10c320819b49332869f5576",
         arm64_linux:  "c97d769902ed2ef4bbc6b46c1d1472b29944bd76738f843e462cfbda68f05294",
         x86_64_linux: "0df2be3c5dbf0ee13cba960e6da140bea1350da85fd3ea80cf2f89ae11bbafdf"

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
