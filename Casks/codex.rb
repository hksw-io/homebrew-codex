cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.3"
  sha256 arm:          "3714d525776ab1b1b10aed91254388c212124e75e2b266d12a555ddb045ea951",
         intel:        "4f919c47b6f669e897073b94d911b0fe1a42a673b0606870efb8c3fe8806da3c",
         arm64_linux:  "ae45d153274ac3d110239fb18b11d70593e886e8f0c87b3b4f5d6d04748ddff7",
         x86_64_linux: "f18a4d89bde6fa7cb4e43f6a515c609122bdd2ab2f8e5f5415964c5bfa818e10"

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
