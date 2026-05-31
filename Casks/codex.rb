cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.22"
  sha256 arm:          "b6219c837e7ca47ba7ab2404e66b9b0f59c565d28fa79303cf3a7409611a1a41",
         intel:        "80d974eea473b994296d5c56b988b44613134b9c09f84b6927cbdb56e1e43446",
         arm64_linux:  "726dccd18ab5cc130d4ddf4791d23e0445b353c753d64a2bb7137f12ca93aad2",
         x86_64_linux: "d6cefcc4e95e7fe9c8ec0af6bd3c415cf1fbf86c259c913ab95cf045dc4f0b2c"

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
