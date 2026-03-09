cask "codex@alpha" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.113.0-alpha.1"
  sha256 arm:          "fd7163ba1a02ffa48390aacf899eeea70dde39b285016baabe8e4b67d35adf4c",
         intel:        "5685b4e09716d996af42e05b16e2214ef1091ae655542b86d2981d50f39eff16",
         arm64_linux:  "17f6c9ebc5132b1501456cea4c1be48eed66cc566a9f2bb65eec4c41fa3cd2c3",
         x86_64_linux: "5cb062df74572587eb6b7fd337bbdd8cdf0259ca638ddf387be347fe5325d330"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+-alpha\.\d+)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  conflicts_with cask: "codex"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
