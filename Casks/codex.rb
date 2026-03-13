cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.16"
  sha256 arm:          "e0250e6f7703db15931cb2c175b93cf1663562fd14adb5c3a5694ff689308142",
         intel:        "3661e6f036f97268e7ed1c0e99af1b479e9d34c3c6eac5f7a63465155ec6c84f",
         arm64_linux:  "f502c3ae297a065646a32b3fa989abd9fc2513abfbe06a0e1428b57a7a00e76f",
         x86_64_linux: "92e973e6357a08bfba756e19dd57bf889d400a3e52b93eb9bcf452394b445c88"

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
