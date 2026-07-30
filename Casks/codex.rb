cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.8"
  sha256 arm:          "fa923b8a45915c012b8d444f9d917c67ddc32473a4e9e2770c7868827f9399e8",
         intel:        "f6e4c2bf10ba9a1b1d5c52c955cf691f6b8bf36588d8e4f15ec8c92bef71683d",
         arm64_linux:  "9f8ff2df0c5a8edbd2838781d7b0ca3053847d4ea3c036d873d5ba17b6c2d415",
         x86_64_linux: "91a8b755517a4b3bd13a86e93ec408ff1b8eb7dba2fa025939c6571729da15f3"

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
