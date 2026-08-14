cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.14"
  sha256 arm:          "690848906d5647a3ba4f0150d6a8523355c189b256f9883583ce21342e48cac8",
         intel:        "724a4bbf372824be4632b10834a968fda14d47ac4238416797e50cb60862d5fb",
         arm64_linux:  "eb85cee930f5b81b435d1aa6092c4f120c65a31b589c56ce4a4fe78a9e26a118",
         x86_64_linux: "fa37e8550e0e8d16053331d7f8a4d7f512a7505abc97483d43a9ea53add1a1aa"

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
