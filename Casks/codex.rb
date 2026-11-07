cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.169.0-alpha.3"
  sha256 arm:          "8954b96349997782458639d96c3abffb2ec73b0e47278acb006c8b78c25afea9",
         intel:        "58b9960fa5e5eef082b184ab941bc2ff9751fdb85e395716d1280fb63038d39b",
         arm64_linux:  "96a59d087a05413fb1da648b67e18e479559eeb40f3435368c9b96f8259b50df",
         x86_64_linux: "c68f65b68cfdd7372da5e4ba762f28b8557bad021f0fbb1ace30a8be60f14616"

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
