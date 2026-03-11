cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.114.0-alpha.4"
  sha256 arm:          "1ad33de0563a01552a95cb6c731a1b8613bad990ab3a8f6c90851c351bedfea8",
         intel:        "838c597d70dc0d5c15ca6c7fc08c4c154f9b44febea1008966b154d710dd0fa8",
         arm64_linux:  "9d168ffa1ed68e446d5c05860917342849ec473be2bc0aea9b7f749d6d51f69b",
         x86_64_linux: "a29575e5bffc7debfacd0164f344c3fd640e72d7cfba7f3fbb838f1d256347eb"

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
