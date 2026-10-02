cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.4"
  sha256 arm:          "938a44ff5237825362e87d7fcfbcf938acc3a4639181f037958591a811ff7758",
         intel:        "605c96d8fe96026555f934c1a9b88478538ddd5575b4060a3d8da80f857d1b07",
         arm64_linux:  "9c3e5219adc972d6de121b14f50a42390817bdea6e6260b89d958255da882676",
         x86_64_linux: "4bcf430be2005e690150085f682a67e5e9433f7b27b1ccd1cf159940ee3d2635"

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
