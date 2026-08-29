cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.152.0-alpha.1"
  sha256 arm:          "cda318f448f284d39e27ec648f0dc8219d92622647080c2f9e7dd6230be15e6b",
         intel:        "5f614eb01f8a716bfc5816b3ff3ca37484e41761c04dc2ea0b8211ec13dbb199",
         arm64_linux:  "b206cc4556188a9c275ae333a8d3be84c0b263c08e7209c71d4e4db80d9da513",
         x86_64_linux: "03eff5b0b61db09ac0c732a1c7ea05ef5340d707ad5b518096b4bff77fc3595f"

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
