cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.4"
  sha256 arm:          "23ed5e7afefcd912e3e38db4b0f8d327d4520b4cd730a725b19d4648e7b49ff9",
         intel:        "3d668798e5beab747846e5c7900f9aad2fb7e4fbb0b516264c00e90ef5c530f4",
         arm64_linux:  "a8a135762f2f1edd33a57ff87cfc178341497893c8d4b076f7db7b92724379ca",
         x86_64_linux: "84943050e126b2845e2dfecc4aafbabee6d64d9d8435b76c53954f3e41c75231"

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
