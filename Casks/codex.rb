cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.165.0-alpha.1"
  sha256 arm:          "d50e47b024b4eaec3df655e93c8ef615a2b1ae117ebaf2cb1f39593a82795959",
         intel:        "aa8c99f3a08f76f6d984b276d7dac7aa6bd1dc98db392c6dae01ea5373297e86",
         arm64_linux:  "1e81f20d25229af3561c4acf88c090d463adbf2f33f72c60456acfa2eaae354d",
         x86_64_linux: "5688c05f88ff833bfad92902b4d44c8e164d981e38562137a6a8db810671922d"

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
