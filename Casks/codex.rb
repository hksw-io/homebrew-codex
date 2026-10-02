cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.16"
  sha256 arm:          "94b4c9daccee462927e60423a70e984d4f2f6de93c1b003b3b65523a4da13ba9",
         intel:        "bf320f2f008d5acef62bdb220445273913b0a67caf65c7897756ce5716d0d71f",
         arm64_linux:  "b6052e4707c946c499536b4debd0158a30cb94ae73e3edd808b783b73f2a90ca",
         x86_64_linux: "ce2a9fed822e824f314bb49f658ed4e05aeca85cd69385f5310493cc42b6c0f7"

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
