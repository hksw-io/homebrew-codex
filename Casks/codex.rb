cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.4"
  sha256 arm:          "413c59f84c7f88bba17b52b65eb6373c15fd9293ed2c12214421a7c3ca374044",
         intel:        "ad3212c7c6ec8cf245a7baf12e3221d43e7552740284eee415ab9eb38d928d7d",
         arm64_linux:  "5e8f319932c09ca840281d7c5ebb923722039a9daa6ad9adf2d09412da77ff59",
         x86_64_linux: "5a7b7e2c6a50dc5a7bc7db10b4ef74e9b010dc53541b5b9f262b1da669781937"

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
