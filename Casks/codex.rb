cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.170.0-alpha.3"
  sha256 arm:          "64886a5f1b910918a719bb7c302e7b6fddf64032ea6efcb91f5769078c178d77",
         intel:        "7ed7e9a3e52efd02089f86119befd438c7ebf52cc80d4c93f674d63dbf858801",
         arm64_linux:  "1c2802ecf7fd340d7828b78ad280181933b0324afffe1cd28ddc32678965d666",
         x86_64_linux: "c7a68cb7a2c023f5531acc4916073c49e2f2afe7ce98ffcc09be457d450592f5"

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
