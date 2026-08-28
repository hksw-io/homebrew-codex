cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.10"
  sha256 arm:          "b19a4de86ebcf63fb4c0985d7882fe31fc4f4b75e856ba153c86bee30ff8668c",
         intel:        "aeb15dedab1a6a18df496d1abdadfe939c80118d10b1759bdb548972e8e3b505",
         arm64_linux:  "4d36b365b1e08c8ff0c7e4df24a8ed0b944d5ec54a150b945905b1a89ac49deb",
         x86_64_linux: "afe783ce75560ce56224d6d70d1ba309703c3b6457878479459131428380e0f1"

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
