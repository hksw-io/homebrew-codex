cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.11"
  sha256 arm:          "009af395603634feee6263563f13f50fbe410bf3bdb8f2b8a63a238eba9938bb",
         intel:        "13f49de70deb0b2b5c0fa1d49dc7a8b53efa6c5fa034b476028601fbbe3f4cec",
         arm64_linux:  "48ef05ab8222c65612eb5b0d9c50bfaa297da431520e15456c7874ccf41ffc52",
         x86_64_linux: "d6d8f2611963198de3bdb7df18c1810ddf785f053259b9becb9e93a5ec3b5316"

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
