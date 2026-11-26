cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.8"
  sha256 arm:          "61bdac6c589c5f9e3243226838cb82b0d596a87b360da5e1b4f9ad08330df15c",
         intel:        "32ac5411fe84ce3dd5e3ed2c75775be06b0b91d1aefc22b02e3a98e2530f6ec5",
         arm64_linux:  "2f840e48b754d48a8922e83650347b5e5fd68abafbeffa081d4cb7b10e30ba4a",
         x86_64_linux: "7e7f8d99a1585c388f06a7ac471e490d701a8dba8231a284924bf134a4bd570f"

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
