cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.6"
  sha256 arm:          "9ef88fd3bbbda02a3f9205e92721f9529fae64420ce2dab3cb892efcfcf36245",
         intel:        "009f6acd88f88ebfade5569c4cbb97d3862bdd5d4a600b86367b6e5b959e7008",
         arm64_linux:  "846375f359b6ff709fb16260dd0f3ebb22cd3988dc7df3f804fd2129eb1004b5",
         x86_64_linux: "6e20ec27d55b047154b98918883b65d74095276f86c9f8d8e514fce02acf618b"

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
