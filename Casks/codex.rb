cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.118.0-alpha.2"
  sha256 arm:          "e089e094614e0a8403bf576b42457ba15c322032d2859d5ce6a44d320aa6ed5d",
         intel:        "0f55a438896a8607262e9ed1aa43b6c1ff7c7086e2cc238b00028ff2f3b4b54d",
         arm64_linux:  "676510a04adcd8626bf006f2d4b087fc0cb88f69654a05adb7f9e5558e429760",
         x86_64_linux: "b165decd92f6f033670a323f94a0956db7d0a81c39c61fb5732ca7872cbcba54"

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
