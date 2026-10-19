cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.6"
  sha256 arm:          "79a69bf179f4c71d3e5b541544e2c2bd02d938604b45b050d05fe0b43380ffde",
         intel:        "d704a8333a0fb11e9207b3188ae3cfd257f56eceac6ef20b3b79f1150308b6c6",
         arm64_linux:  "62c00e3ac98d0fd21a385a6f579604c15e8aef8003cb0918e4a182aefbbfeb52",
         x86_64_linux: "cb777b012939344ec331ba21724f3d2f7e91b8c3cc0dfe89a896a907ffbd0430"

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
