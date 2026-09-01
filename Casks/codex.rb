cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.153.0-alpha.4"
  sha256 arm:          "19e9321121070c302989bb802255482a0f150310ae5f60801856500500eef123",
         intel:        "2ab906b5308a4a2fda727f01772714f0289f3f0229045d6d9c8eddef7f879bf2",
         arm64_linux:  "17958fe249d237e744edef6d56757719d62a2356acbb9fdc2a9885d12dbfd9a7",
         x86_64_linux: "34556aa24ea913803d45bb76a455a95894aa5675fbb0e0f85cdf318567039d9a"

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
