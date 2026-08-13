cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.12"
  sha256 arm:          "3c696978fd1eb0c8f832f2c16d010f9683f5b233644355ffd9842dbe2c746fb7",
         intel:        "8ecf87c032c9b6a2036b5a59af24bfe103a4c4ae003e62a02909f12cf8ca1fd7",
         arm64_linux:  "fd3cef0a430f823da136db8ca624f78d8ba05e19c1c8d0de602420bf0116d9aa",
         x86_64_linux: "958299efdeba877acbfbc3464479c33e14cc214aa05a329599047c7f0660d486"

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
