cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.9"
  sha256 arm:          "f187fa44749e4071b3b6af9444ce28bf1c27e06e5cb36842ea23ec67ff6c767c",
         intel:        "97058f51332d46a4ad1689d8c8beccb26861375ea8b6c837913c957f5566b00a",
         arm64_linux:  "deb497a87cb705f075b26733e3b6d6c9a62c242cc400944060d1e3873e33ef9f",
         x86_64_linux: "a8c71af1f8c440f26abca37b1ee129f7c1d84640aa213dc764bca63c014bbb4d"

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
