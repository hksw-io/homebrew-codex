cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.8"
  sha256 arm:          "63bad60c02007ce0dea04577b9e67ef0f88368c52925c8ef3a02d21f0a647b13",
         intel:        "b10a3769c8ad235df514d172518019a8b10be524bea2aac78a8559a4d55f2a55",
         arm64_linux:  "ceab0ddbe0c6abdd8265dc1324043dc37db6e98ec2362d3dede70ab80f84d945",
         x86_64_linux: "0fb9efa95bac6443afeeff0eb921164e31a6ec73fc776d5e34461414c7e5cf06"

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
