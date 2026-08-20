cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.149.0-alpha.7"
  sha256 arm:          "5b56c41eed83374692f2d013933f020f77c3befc9ac9a857875602ceb6f5a55a",
         intel:        "1fc7834a2dc9668b1816fbcecf5349802dc1b8bb59967eb3f9a6bc921a35d704",
         arm64_linux:  "c675514c392d887a07a940f34d20b4acc1904c324dd4e712b265c3c94409d05b",
         x86_64_linux: "bc7a4f00742c98f2cd524a697c1c52574007dfb7eaf182f163a8210075137048"

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
