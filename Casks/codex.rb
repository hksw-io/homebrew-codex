cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.13"
  sha256 arm:          "934432c0fa0dec5efa5088f136b31b64401c3b573a0578a3e5d9a418fc461347",
         intel:        "01813a669236202ca0b54553d7202b66d267b5ffd3180e064e7383b94cd43b5d",
         arm64_linux:  "9c354b6ff0ddcfdd0633d39ff79ed22f829cc1937b4d25cca0cac4df504b4217",
         x86_64_linux: "0899d6a86c9f1098ea38ccb426ae72243c81d63dc79472011900d95d94da3de3"

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
