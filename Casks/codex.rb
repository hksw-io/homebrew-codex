cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.7"
  sha256 arm:          "e1fce508a8899044b7f1c37385a0ddc0769521f5d049b30771ed48b36e0c84bc",
         intel:        "148f9932fb47b1139c86fd99ef5cf656cbb557ab0915dfdc225726193ecd2d1b",
         arm64_linux:  "0d837b3828701afa1a63ad8c6f22c7649a96eba728712bd5d1b3377f0dcdbdf5",
         x86_64_linux: "bac73249eae935b2c612f91d52537391b2a1bbb68f73287947f34a81a4e02919"

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
