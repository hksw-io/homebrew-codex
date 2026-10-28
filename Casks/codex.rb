cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.166.0-alpha.4"
  sha256 arm:          "2e749cf19a98ce574a6eb7761886026de5add3ee4e6068259b83f990ab368195",
         intel:        "9e2045d2d4d4b71ef2e94063faadf969af59dd5d53f6a747fb1a4cfa201cd74c",
         arm64_linux:  "7673b84ac6c91669319ffea68cf3765cd18ecdcdd365b9116d85de4055059833",
         x86_64_linux: "243e63ed50b408ff48d6026ee7658c03d46b3f9b4aba99cfc59e735c5caef41f"

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
