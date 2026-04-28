cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.10"
  sha256 arm:          "9b4a3f091d2626e1e19c48f24006bd03be15009f74360e209f1012f113615b68",
         intel:        "5ddeb8f5c5884838023bb08641d16ac7511c9bcca8c6914514091e5c2af3b071",
         arm64_linux:  "7f9bf8df8dcbcee0e481f072688bf2bc70c34c173a3912bcdaa7c00995b0452c",
         x86_64_linux: "a4c891437710b3722cb52f1baf54d09707cee9d0480cd9c36df5716ae194a1ee"

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
