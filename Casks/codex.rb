cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.166.0-alpha.5.1"
  sha256 arm:          "ca59380ef9ac9a5ca96d71c4effbe94711806e6f78f8185f749af0f219a8cb81",
         intel:        "a998001f8f033b8f3c6f5da3a2b5f7b7d080c3127b3af9d163dabadabb0a09f7",
         arm64_linux:  "b2e5c3d5793f7b1c7c05c7fc4e10361d481c72227db750b0c721f38e72270614",
         x86_64_linux: "e07867df5fc23167e0d65123e60f2f9a8dd6d4a67bb5481097b19d05a8d6106f"

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
