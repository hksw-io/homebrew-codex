cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.19"
  sha256 arm:          "027ed17082070232f66fd9132fdd9e2ec2a90d4c8428894a7480db1c6ac644ea",
         intel:        "3231ba42e5ab0dbc67311fee0384cee6e3e85da2c0ac15d0d222c118e7b7d043",
         arm64_linux:  "4c8cdfa2358a8aaffd3ebd0c15adeb1f11ab335ba9fc791892b717a2708913a6",
         x86_64_linux: "1335eff57aa34695e230b13187f29811eeebcdbaa7ed2e0f65123fbfd9dd5615"

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
