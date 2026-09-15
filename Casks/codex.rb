cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.6"
  sha256 arm:          "95330625949f1814cf974bfd4e038e1cd0e404f2b3d7d95c3844c9e845afc25e",
         intel:        "215ca9d434d2634fa25b98e14838d8fd4596f79538bb61f6cb4682e8a54832ef",
         arm64_linux:  "933309821f61774cf904ed5d7c034bf81da528b6497912599f1c4957421ba458",
         x86_64_linux: "d21bc1bea8ae8c957c7a5988fbcedfb0bd6c11198f77218521ab346e6c6eb862"

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
