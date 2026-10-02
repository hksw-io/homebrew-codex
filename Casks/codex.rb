cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.17"
  sha256 arm:          "5b1542dda99e1e6d8c15b8212989e96dd5ae8f225c3897f769234059894bb26d",
         intel:        "d62c3ffa5b1bd923c6fa25aca1063bc088e9491978c9205d75dc0f22792c0cff",
         arm64_linux:  "a412dcee04959f50e1add11bd01d277da98b57ec75d63298cb1ee2a5266630ae",
         x86_64_linux: "c1132387f753c0f48f8face30d2c9fa6fe2b28559bf324a9a625c11585071186"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-apple-darwin.tar.zst"
    else
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-apple-darwin.tar.zst"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-unknown-linux-musl.tar.gz"
  else
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-unknown-linux-musl.tar.gz"
  end
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
