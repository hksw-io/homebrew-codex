cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.11"
  sha256 arm:          "bf102c39776bd5417d119132cd978ef05243392e8b229483344cd475d0ec2f8a",
         intel:        "8d36683bfd0b4a99eef028529d71bb1c87d66a8ba0174f097995f5bb066f6e63",
         arm64_linux:  "1dce5c7d0926445bc305055a06b2854500e2c006362e760ab68e7c2dd2c9fde6",
         x86_64_linux: "8e7ee9b80629635c932c7156ed22ea8d06892dc11a92dcbeb658ee16eaed573e"

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
