cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.9"
  sha256 arm:          "61a9bd95b11192791ae5d088baebc7319667e7001646c9eee0fa102495a9af82",
         intel:        "06f8afd8e60593aa14c662262a3ecdb7ac19c6fdc21c451672fef639894a8a03",
         arm64_linux:  "764c8f9c5d8372eb777f751f60c998e20390cf6945a5cca26828a54f966fee1d",
         x86_64_linux: "cba97974e5e078d3329fbd6e1bc4efbeba7ed5bc7ffbe7ab57deed093893a3fa"

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
