cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.12"
  sha256 arm:          "76d56b2a0dd98d248b9e9a218f6d77edd5ca0e6e0c673a64e2fb0479b193a8e9",
         intel:        "c2efe09caa714efd94c84e11c985365c7c5b3ba160fa59eb98d11bd5ed066a06",
         arm64_linux:  "beaa2966c4d4b184484facc387698bc691ab192fbba887086e0ce5214d386bb9",
         x86_64_linux: "5d9432914c8ccd1653a12b47d0248394a2c6e4245d4944fa9f64c72fb436fc25"

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
