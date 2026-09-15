cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.3.7"
  sha256 arm:          "8cd44d941b3773b8b8812aca2232be2f6e4340770df47ca879ce24298d5b17e6",
         intel:        "2881a985e4803affc897f33b92d8046b2cb346b5f6a430f92a76b033cb3d8ff0",
         arm64_linux:  "115e5f10a48dfc2c245f51b1543ebd6b2bb1b7f64a7c45ec28f974211c6cfe51",
         x86_64_linux: "0c44f9aae3bf27eea0022445b2bb00ccc4cb8b6eb0e5038d184d239ee284b541"

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
