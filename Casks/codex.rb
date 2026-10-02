cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.5"
  sha256 arm:          "451711879e84bc12253356f1dbd4990be0cd1c2ac236159d0311b355d96510a7",
         intel:        "440f7a56822e2d5851aa25503937f3b5eac89d850faf4047b8ae777fa71865e1",
         arm64_linux:  "f34f5b40824e68920093d5a51829c334fa2826a183df5d3d5c960b776ed4c4c5",
         x86_64_linux: "48477a30a10836c76334245e39ebd47f56fd0eb7a8a6d3010bd4238b82ebd912"

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
