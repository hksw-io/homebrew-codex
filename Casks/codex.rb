cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.13"
  sha256 arm:          "7d57db1c3801044a0e06d4f7ec278471367283ea06aa3e97de542220bc324ee7",
         intel:        "1cac202dae13f71bfdec73c1de9595ea0ca6e2e9dd59feca05af7c0149438150",
         arm64_linux:  "ccef87923f828dceacde16ed6ea5ed6d5c7eff4c2d040ce266274322623576d0",
         x86_64_linux: "40a2082c983eed0122aefd9740f77fc4e961a3b3db196fab1a4a308621f5648d"

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
