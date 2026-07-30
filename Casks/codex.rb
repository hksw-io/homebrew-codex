cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.6"
  sha256 arm:          "d7f976ba0585a3d791ebcda65f0de97a934662fb89c437eae1b4c3aaa17592ba",
         intel:        "3939f35696f1b0a42e6996ebf4b483b5657637fe9f851b165c4667e6dc0e114b",
         arm64_linux:  "3ac3ae4ba745491038459c160b92c91292d8dc2f51da5ef26f123c188ec18869",
         x86_64_linux: "4034e7b153dbe944d8773d4669c5659fc5d61fde64a5fa567858a9c8f836c971"

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
