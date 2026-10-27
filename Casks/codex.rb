cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.166.0-alpha.2"
  sha256 arm:          "0fa1711f2b21ca2ec51d529b41861042f408321f891256c72e8aa72f07d36648",
         intel:        "cdce330f47ddadc8e5f32625937b92b74567573941e32b880ff13d91a95f047f",
         arm64_linux:  "71355e1631b67255678806411ded2d9dd84da9506af811595e7778693fe03b6a",
         x86_64_linux: "dc0cec3f01c9cfaceed58da09a36702ddc2ba214baf99f0cfebad1461d98a7bb"

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
