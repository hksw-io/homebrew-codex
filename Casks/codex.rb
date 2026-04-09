cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.26"
  sha256 arm:          "839062295ec870d921106cdadddacd1ea537b7064185e6ea5afc319a34f63bda",
         intel:        "7ea5188e9303e934cf6dc430bd47d671f455718d0d2b51eb1f9f170ee6059bff",
         arm64_linux:  "242d50960fd56291f76bc6e4d19bb0e737360508d16cfb6b31b39e5ce88822a0",
         x86_64_linux: "fb214908579025ef363df9e1be4baad0fdfe93d61e5f6c9ac377f73fae3028ab"

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
