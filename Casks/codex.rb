cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.13"
  sha256 arm:          "26572937312f57fbb779989693ef33702c4cbdead44ea6b08fae479ed6ad16d6",
         intel:        "b03a41a5d485181cac764af1f93cbdbbfa16ed69a8547313498dcdda9134eb08",
         arm64_linux:  "95934111c9ed6e1bb8d8a26587ff719dfe651fa1f932c4f2dbdfd2038dfe8cfa",
         x86_64_linux: "249445ae867048124f08501e8b6b2bea2ba5b7def55668579d986ad82ce237fa"

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
