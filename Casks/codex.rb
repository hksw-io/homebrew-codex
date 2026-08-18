cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.23"
  sha256 arm:          "e5c2fab8359a60e950c2e5ef32f16d80066b3cb3c304a8fd48ec2440ff6c7c14",
         intel:        "8c74bfd53cbdb0cfec2b62274192498a11bff06fc8b91def2217fd22ec1cfd78",
         arm64_linux:  "e5e89306ffe8b9c6a077b3779429a1ba0e7e8679bef347a73c976348c7763cd8",
         x86_64_linux: "93ff7b2766fe6c2ea1b7fcdd9ff0d1ea72b7fb40d91ab2267c93378fc688ab08"

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
