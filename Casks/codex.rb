cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.152.0-alpha.6"
  sha256 arm:          "1b187d672b276dba22441d823f1594fa5307b472854a06629313075bbba2e75a",
         intel:        "1c288568e8b39116c37874de0ea60650f6139b8400018d0cf0516e8808ded702",
         arm64_linux:  "63cf34df8dc8a0724f132ea5d40a7600a210d244d3bd33b766d35b8bbbdecddb",
         x86_64_linux: "2a33eaeff92f3a09bceafbd344aa5d0220eaba81f8b5a6400a61299c063d7110"

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
