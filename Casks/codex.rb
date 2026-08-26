cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.13"
  sha256 arm:          "9309b495882eb0f30e28037194785df18f532245ce823ac4036d5a0429c4d602",
         intel:        "6b78a203639a1f597120ec438bbf51f8d2376d2936c52e246794ba5d8bfd87f6",
         arm64_linux:  "4456fa2c947a1a1564619ae3d94a0b5ba3f1e9ddc9355dbc7eb7e5de5d308cb4",
         x86_64_linux: "40dcf4f2e4db044c64542c3a110d73dab86280b5fd1952d49b14d1429e4f0d64"

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
