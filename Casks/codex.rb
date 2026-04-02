cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.3"
  sha256 arm:          "d58194b354a8d3bcf0e43c7fb4adb410ab524dc818613c6c35952cd7fca251cd",
         intel:        "2176309ccead6571646ed69d1e7b95949b3c34703ac013ca05d26613302d4884",
         arm64_linux:  "ab58f85b4556c5371224c6c8d4239e9c6797bddcf05437e354fbfaf62d79e99f",
         x86_64_linux: "2f035870c5ca570006632f2087c413d17cd4b964312e29f93b3f8478b6269f97"

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
