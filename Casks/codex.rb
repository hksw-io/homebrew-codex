cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.13"
  sha256 arm:          "47221a9d91b3edb369e2bfe06c2460b654fabf0db0cf7dbac2601c0a755f111c",
         intel:        "7bda8f2eabb4ebec2740a016cc7db73fa3bd0ebf4a02e9cf7430f12d68ed1c97",
         arm64_linux:  "018bb0863f4986a1c5b9c387240b5b7e33d068a8bddf7ecc5ad747ba08614cf5",
         x86_64_linux: "380899863d9b5662ea93f41b8df077187f1ed24b12ccd8fa967d41d6662b0bfe"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
