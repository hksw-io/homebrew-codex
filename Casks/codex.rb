cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.5"
  sha256 arm:          "acd7419f153cb3c972f5ec507ed21b85f77689ef974771170ce8d9049e5c0050",
         intel:        "47f6e729a702e46e4fea1f90c0521efac3796439625441088edc0b86e796a6f4",
         arm64_linux:  "c94375b1c7c02b1c72a2bd07752b1ebba68f32cb622c3fa2cbd91820e5d863f6",
         x86_64_linux: "81df732cd46e92e9f49297d684b46af01af9b6709b14019725f31bb99f3838a7"

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
