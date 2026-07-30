cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.7"
  sha256 arm:          "9c76189cd45596551516794cc9ef56f3082a29ede705c0e22a204c4a450f887c",
         intel:        "afcd6e37997064cee861507e5bbfcb83eba96e46cbd41751ccec7459c24d11ba",
         arm64_linux:  "bc249dd38305e6e0d0c2ae7499753ca2073ebd13daaa302fd3d4266ad8fcdb23",
         x86_64_linux: "a18e4a89521ac478c877b2736541d364903b008fb569a4727240480a906185bd"

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
