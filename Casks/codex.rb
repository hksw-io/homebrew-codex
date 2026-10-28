cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.166.0-alpha.5"
  sha256 arm:          "74df1a5a86b22ba4f80c4921d7226f0baf7a6c5cdfe0cb1da43a5fa2dae05bd4",
         intel:        "1c8ead2942caadb7cb4ea3ce5bbeceae10068c05710260adf047afe7e61184c0",
         arm64_linux:  "bfc4f573ebf6d72167c6aca1fc3f455004a16b89e1cb56d9b499ff0e3dac24dc",
         x86_64_linux: "a7c3c73f98cba7b44024a8254d5fb7ece77a5ece1e04f7e5d27a699bc1ca969a"

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
