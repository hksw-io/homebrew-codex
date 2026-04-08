cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.19"
  sha256 arm:          "ed80b50e8523e114d0979dff30be6384c7ee9f54a2aff11d2ee9100d0e17c08a",
         intel:        "9836e43298d6073aca57ddea78df03dc6ff993e8875150dca757152e1be92226",
         arm64_linux:  "cd219b7d3e1bfe5779dd946f10d2ad5ce03b806c80666b9cdd248e487331e41e",
         x86_64_linux: "80b846896fccca79c2166f8877e2abd0e4f46bafa623f3bc1a97e5d9d9475911"

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
