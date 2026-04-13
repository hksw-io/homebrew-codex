cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.121.0-alpha.4"
  sha256 arm:          "72089f61cab11b54affb983ff293822428a2817b21f80583b632a07338263084",
         intel:        "92b2a47d15c715eab781b7cb41d48ec23a8bee850808b81a053933a3c63faaa2",
         arm64_linux:  "a163358ca381274a499fc68cae028855f803ff8a15c15894e51f29aee253f0a2",
         x86_64_linux: "3f33ffd32d156f6ee81a81e00ad4b6396e57805f7eacdc0470f53345da7efa87"

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
