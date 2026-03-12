cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.14"
  sha256 arm:          "d787a414445b7e51002083858e4469a03735121ff21f888a2bedd8aba5687d85",
         intel:        "af50de2349138582f2e0516d6ce9b35c46daf12d57cbd7d831ed52511c91552c",
         arm64_linux:  "2ae3841bed79b954ecb7dd5232b00ab86fa684ed23ca49c9a5a9e670ff59b682",
         x86_64_linux: "9e92f9e0fcedc956c3ed3e6c4c36cc6b093ecc14476173b563bc5497e34ed11a"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
