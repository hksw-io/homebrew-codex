cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.114.0-alpha.2"
  sha256 arm:          "046531d05ebade71617641f325d54e670d549823055af7249b8a95b9d5627408",
         intel:        "db30bf480f3f4cd015bd8d04dc1017a71e938b349db2fc13ad8b66991a2a72e4",
         arm64_linux:  "21fca7e55d9787efaac74c3bb149d4f5a5ec111bee579b8d7175dac64ed95b8a",
         x86_64_linux: "10a0caa707d7c7f3385b438458d1de4534934176dbf312877bf2db9174c69956"

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
