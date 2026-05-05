cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.8"
  sha256 arm:          "e52ed620683383a37554df604fe94d4f6daabb63cd1871bf02acfa58be3f1666",
         intel:        "9309e50c00c94079113e63bae48f86fe9575f3121c3e0d4c51f1d6ff76ebbce7",
         arm64_linux:  "5936021a082448648be5ee3c08c7cdb546f3cc7f8851cb6e26e7da9c1fd798ad",
         x86_64_linux: "4101318b7c3ff0cac5732f2f663e8c77f41b788706b4566d178f8070493a5264"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
