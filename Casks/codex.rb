cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.1"
  sha256 arm:          "2daf1cf60202114f0367d478cd156eb978af011f14df1218c1b392992bbcd53e",
         intel:        "04fa1f3a93c12fc2802b320efdf0c7caaeada69a3aa2870937df29c28e81e794",
         arm64_linux:  "35f6c275013513ac396c0c3c848fb1c1dd017f3b4bfac7934c2cc31e5cc397e7",
         x86_64_linux: "ed64d56905420342f173c008ee16e97f01e7709df0c8699b66a133435f6b3fb8"

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
