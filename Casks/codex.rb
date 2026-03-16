cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.26"
  sha256 arm:          "5acc75f5fb6459caf99170507c286a08c1e2ae30f0ab73e58c7255caee947be5",
         intel:        "ca09d01a3dee1d012a9950228dd3dd0dae007d6d7b9d954793a1fd605a8ce4cd",
         arm64_linux:  "595c8ead5e34fe2bc44c73aa7c609a067d36c9054c1b77f4f2f3fb8d8be2d7f8",
         x86_64_linux: "df365c11556c9dcbe78e79f34f843e67a475104c794902413acd191b254cdd29"

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
