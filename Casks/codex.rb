cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.13"
  sha256 arm:          "7fe43a1f4e774ddcab04da803d0411587fdb23b105e3f43e538788841cc9c104",
         intel:        "34cdaa4e7c2351f308356383f1d37b75df55de1fdefca83eb126ae920be230a6",
         arm64_linux:  "a1cff9df90784974bed7fe468b83d8ffefd91f6f030efe324a6c8dfb2b5ac0b5",
         x86_64_linux: "1887b68a11238013ed357e0c458ae7370c3a406338226fc24810a90e598a1b65"

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
