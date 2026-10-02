cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.14"
  sha256 arm:          "cfd3cabda0060d3485d9195b650d8f589916c19715c8a23a5a674dd5bfbcb3d6",
         intel:        "dac9d090a120b7274ffe80d4fba0398fe74be67af7260d0d4faf8ac2a58f112a",
         arm64_linux:  "e5054bbe8fdcc2df0922d412174b1fa97b8b417016a8895c6e011a962dbcae20",
         x86_64_linux: "ffa19f0409239f3d7d957c63e4aa4e5d231bc33da116b437b5ab87d561c1868c"

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
