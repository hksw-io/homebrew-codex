cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.18"
  sha256 arm:          "69b374c99b835363f56c80a950f70218d8d236c696996e5769d6565df95dd698",
         intel:        "0a66ecbf461560b6401f5669a4888ad65e8699148a6edcb03293ccaee7c948f6",
         arm64_linux:  "219dc4c73a39414eb5f3e08c1fc434af19f5892959ee0dd392da2e805a0b611f",
         x86_64_linux: "2f8ea3764b0cc99b3556e0b76ac80e652606d5e080f6e1fdb854b29df1a3e8ef"

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
