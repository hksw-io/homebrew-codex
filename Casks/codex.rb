cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.3"
  sha256 arm:          "85765f6a200b26390ff6dca57f4561c7c6443759174efc669b30374023a13b73",
         intel:        "6a1f430736f32e86ac8292b5df7551c21d3cd7e626fda63a07edc4b87654b8a9",
         arm64_linux:  "b8f039d95a54638d675d43adabe1d218805a73018b763083204382dc8302f87c",
         x86_64_linux: "dc1c7f666dfc51fce9a8638c4e269c2694f6223df07bb1bbd8e8d1b35f88ca2f"

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
