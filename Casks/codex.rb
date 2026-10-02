cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.6"
  sha256 arm:          "170244106e97d808d2f8b162c79dbc8473b30057990f7efef4c422ef51f3d1e7",
         intel:        "d2ea3e001485a851c48b9ee7fa88d01bc7c5094d56760a1c88d44ce3174d2e4c",
         arm64_linux:  "fe5f248ed13da83489c7b1509aeca57a321bf86b5809866726b0d5b98ba606f0",
         x86_64_linux: "f67280bf31789328f0f893e8a5f6ed980c2ff993bfc61ce88c7b49b09f024544"

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
