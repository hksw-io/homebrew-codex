cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.153.0-alpha.2"
  sha256 arm:          "4c043ef238d1e86855d8760c4f884c571640fcdad6bb21c82f4c638b886d2eaa",
         intel:        "e2b9c558a3ee34c9c9d074b2e5ec5863fc56f13c9817bbbe3f2ffa910e973d12",
         arm64_linux:  "a57d16f765573a277ed0519c6f034377c5457012752b6f8fb3853f46000080d2",
         x86_64_linux: "c453bf7646e2877a0855779e1635b21630f5b730c27cf73edcc11a7a77f7dcec"

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
