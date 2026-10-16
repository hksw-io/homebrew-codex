cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.1"
  sha256 arm:          "59cdf45aae209aa027b4d97a2c8f39c5ba3fce97de7b5ef0bc0c191b8d3ebe1d",
         intel:        "24ccd490a4936627cc086f6a0983002387c9900aeae32e5c1ab2e7ea4cace5b8",
         arm64_linux:  "0f04e3e98521e4e144bdc8b2f07bc75be20b72ee0be0b9db33d3132c1fc92280",
         x86_64_linux: "26823dbcaabb1d78959eb701a0b9f2345ded5b96fe65ea8310ef5e85b9b46495"

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
