cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.125.0-alpha.3"
  sha256 arm:          "3c458779dd1a20a2dae429246ee888bfbcbf3c09c163a729da91ca4128070198",
         intel:        "2bfe75f9181874c36c8302a234f2e91a2324aa4f102c8a3692abaeb27df3d221",
         arm64_linux:  "3bb359785e569f93fadcd393326b070db2fccbbc6103810fed5a5f14f5b6d0b9",
         x86_64_linux: "78f4bd6674812b050c5dd1ada55e67a9dbaae474564f97e48cb06eebfed6bf90"

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
