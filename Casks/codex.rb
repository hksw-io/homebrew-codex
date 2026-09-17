cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.16"
  sha256 arm:          "be8395011e91d7526e42bfcc84043550c4cc56e6d91dbc0d911b2ec3ef059d34",
         intel:        "2be42476a5d8bd268210a47db728b884d76c26a5030ecdea33eec08cb400075d",
         arm64_linux:  "5b3aeaf236031e2b1e1b192f36027d1ce2b51ec40930623ffe4e2e9d13345db8",
         x86_64_linux: "1fc1c6284cb3425b806e75209f6272151ac8632a86deb342b62f8c13f98f18c0"

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
