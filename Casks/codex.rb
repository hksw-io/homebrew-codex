cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.170.0-alpha.2"
  sha256 arm:          "db5ac8deed5ae53d59f75b0cf3e9da3e223b4c5714030fd3c70f3e6d830fc1de",
         intel:        "d7cb34d43cc18757ca5622f93a5b78131a33ded604f4bd1c6a79ddf3ea524668",
         arm64_linux:  "2d339a37c3db18f19088d9a377c7e477e87b08af6aaa8907959e470e2cb842d1",
         x86_64_linux: "892e4a1bc0fbcfaf3a88612fcc7a11ec0ff3ef07f47e5d8863826759ecdaf010"

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
