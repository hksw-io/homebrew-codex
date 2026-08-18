cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.22"
  sha256 arm:          "6a356a267b99bf6019c087ef1f950db14ea063b12a1bf1d1739f9ed94456bd08",
         intel:        "e6cc563eb0ea93e64f5c269a927bfb89b878db606e223ca49c423215e6576d17",
         arm64_linux:  "3c35e515ebf9b7112d1ee892bea6ba5e9d544c7ca0d978febdb2ea58d8dad03a",
         x86_64_linux: "77c8d405f03c87796e52c97c006613ea96dc37d530ff85d3e1b207e40fab5112"

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
