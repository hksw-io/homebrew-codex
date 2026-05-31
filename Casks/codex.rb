cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.19"
  sha256 arm:          "ed3f68cfefe52effb920ff3724f3d072c9ccd9d7b788ca9ae5ffb63bb483c587",
         intel:        "147dcdefd95807787f30994b24a80e08fb77a87726a9e1b1694158ea60531911",
         arm64_linux:  "2d6f04b59493200fc18fcff9c80d67bed2b232937972b44c3cdb3cef97b049f8",
         x86_64_linux: "13460863c69c8e1c980c0aacf094725568591fc82cfd1cc3b83ba1b53709ac98"

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
