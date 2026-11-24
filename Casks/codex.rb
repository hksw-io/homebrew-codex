cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.1"
  sha256 arm:          "7b98236913c4fea61b3dca9e910d4f2b8ba0364c35d9bfd2ad1766b9e98657e6",
         intel:        "d393aca7f5c893063397ffff81d2c12d51b2efbec47f108d7758779fd30a8787",
         arm64_linux:  "4f54b58115831390bc1c9e62b16885227ea2419750c678f76b22dc3351b8d057",
         x86_64_linux: "409508ad4256523672e6bfa82a2ab31cfe07a2ff1ad86b9e45b0d51923dcc8ee"

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
