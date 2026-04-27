cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.6"
  sha256 arm:          "9778b561c41c1c59b0b1c69dff348fa332a5ac4e6617a0374e64ae111f70f3b9",
         intel:        "a501881b3e2b9644772cbf5687dc32d0e0148277a01abb16738b2705589c8755",
         arm64_linux:  "2a497087d2f7c63db8f81612f58182230601f2200054314f8738963d2fca5ce8",
         x86_64_linux: "254925b5ed35fa43e7075853573b02001b47c60e61225c995a421af20b29a015"

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
