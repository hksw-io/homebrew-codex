cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.19"
  sha256 arm:          "2dfa178f850f1971fe7e672b7bc43e809701abb67eefc6f38b421744bfe50198",
         intel:        "b752f579579911f7027c2566e296d799b4c46e14780002b98e47b4c497523cfd",
         arm64_linux:  "4249d4e1c2203b60b977f0588647c5ad8936e2c8f83da0d39eb3629d9fafe74a",
         x86_64_linux: "51802adea4adaff69ae5b13e224523b6b6468bef1c2cd1762415e14ad9872f4e"

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
