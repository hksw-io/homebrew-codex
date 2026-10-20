cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.8"
  sha256 arm:          "12d2bf32edbacef47f275f3baf898f5bebb0565547dfb9cfc5f147e7d8ed3e7b",
         intel:        "9105336c9c0f101720a374e85a5efecc70d0101892976a4f78450edc3f479eb8",
         arm64_linux:  "78e761833f2c8a71787a5e3642eb0019ad4abc870af2bf1404e5bf52bddec61b",
         x86_64_linux: "08afb9aa941d39141c026a0e6796f3cc539d4f6d5312b8b99fa88555f3f2b7fa"

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
