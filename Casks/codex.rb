cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.125.0-alpha.2"
  sha256 arm:          "38b7d6e02571bacedff2f81d46e9b76634388c6fce3d41b8843a9d168f0f41a8",
         intel:        "f328b046a3bbd01d5ae058328dfb5e07f45db61d2f8ff26bb6fdfd1d7cd86c14",
         arm64_linux:  "8a866c06f623d43621444644df054c0844aee4468f1d2166ac701c49d1803f65",
         x86_64_linux: "476236ca4e89a064dc59bb07e333ad407e617bb6f89e9e4fc17f2cb438d9b477"

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
