cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.8"
  sha256 arm:          "bf6cd677b6da7ac6819a0ed782936a302513a51b23a1f32256c7bda94fa8d10a",
         intel:        "29870dd3f24a3096937e0db788f235ae631248cd98ad669300679d2fbaf23317",
         arm64_linux:  "1cede61f484dab2d3fe02ceb7dfbbe3d0e9e8c11a635a6f1c8f0623d42667f9a",
         x86_64_linux: "cac7c4e9fc40384e75331622bae900415c26561fefcc854985e1a7fac997cce3"

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
