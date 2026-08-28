cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.9"
  sha256 arm:          "ade0f86017805f012ffe2bbd9e69954fe838fd39d187ed034ede3d346cc613dc",
         intel:        "090d142c8ed61934056d9a56b845231d7c11b7a1f907ae37bdf06782dc10f400",
         arm64_linux:  "966a689b89fe2eb478de661a114fcb0831efeefd78a4d485f1f3158f9440d1fe",
         x86_64_linux: "58da5cd1107dcde8ffa1add081b2c63f44f16fe7d9cfb8538340a7808fd31120"

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
