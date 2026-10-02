cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.2"
  sha256 arm:          "db4d670d65a053357abd7c2924af3e72dc91cb82855f6174cb8da354359be6d5",
         intel:        "8db8975a0121ef774ab1c71f6aa07a3a9d660131f8440bbe018384d58f909473",
         arm64_linux:  "ab531d648cd7006d54e03a23f16fabcf946a9dac829bf38420faaea053e5b06d",
         x86_64_linux: "5aaec6fe3b649a49f6e1e94792d900544a0fd1e39e25b59175320dfde4163e68"

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
