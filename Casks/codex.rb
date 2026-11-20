cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.173.0-alpha.3"
  sha256 arm:          "4f3bd50d8aabbff17fc14f22477652ebe266736bcf13159680e4555bcb136417",
         intel:        "548a6edceaccf9b65ea6a388549e51689c0349ca1d770e369d73bf98d116905a",
         arm64_linux:  "50c9edbfacca15c64d882a111fd1868535b7d3971f8eca5b115aae5315c8054d",
         x86_64_linux: "c6bfd244caf4c366f60cfdb1e7bc610364d100b54634f6e5e68d9e970374cb39"

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
