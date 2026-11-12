cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.170.0-alpha.4"
  sha256 arm:          "0dbfd9637b580405987b9691f042efe56c2eaf51cec848de870311bccd655c59",
         intel:        "55768fc55d982614bf763ea390abc31d805c1f2138d2f7cb5b42bd00c2c6facc",
         arm64_linux:  "e7c89732f59f0b615945d2856d331d4d59304ba71e6481774f086a4d4fc725c1",
         x86_64_linux: "65031fce7c3ce3f5f92301e7156755ba72976893fd439868ebaf3173d7e43ee1"

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
