cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.2"
  sha256 arm:          "e6a5aa1d864afc3762990fd0df4705cf687e980b28e0fe3834efcf1a20ba7fa0",
         intel:        "963358d4b95b5eaf8a059a15a35a68e7d9735e3500b3826196059f56ce0b2304",
         arm64_linux:  "b3cfddd25f189f584e07ef356f932d2bbb081a17d3da1d93af73bea84cd1a87a",
         x86_64_linux: "f6b3237db010b7d43c9d482167354a2d2759c97e0c9fa9b610e3750be98c3a8a"

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
