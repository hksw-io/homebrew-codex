cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.9"
  sha256 arm:          "242d49996b1b4bee3219c554b72882853958c88abc9f6610fcb44c2739e66fca",
         intel:        "b015a0075773d5e8660e4c3985dfd9527d8025697b3f238d23bead50b54f2219",
         arm64_linux:  "f4bda0ced0b21efd23879634fc275d149a4415cbe7ca5b58f2dce5bebbc51598",
         x86_64_linux: "eef336d0b73d5af9616a4fdc26a471ad66dcee554ea609091f121d3e039c843c"

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
