cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.3"
  sha256 arm:          "ac713987300aafd494c4de507649e9200cb4af42d7655baa66c3e226f4d9b0ce",
         intel:        "d77ab18c677a5b2280f9cc9a3d026e14d10768483c7f48059d9d4eebd5d92375",
         arm64_linux:  "55eb1119a7fd372f04bcb0b14efa54870b1e53fb3e6d68d7a629f0d0a7cbcd4f",
         x86_64_linux: "ddc2ba24a1d118afadd5a1a8d33dff59ddba101d0a43d8a1c4095cee0ad8d8de"

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
