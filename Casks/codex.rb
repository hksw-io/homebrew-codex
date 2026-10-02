cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.7"
  sha256 arm:          "a7efc163cfda8b73d2f8d7f9ff66c253611dadbae22aba008446d1b91f107b78",
         intel:        "dac50b6fdf861db345c6f28b2a33d848ec914c59c66baaf7f013e41725e4f211",
         arm64_linux:  "4fde2269d258682eb7d00f533ee20746e0b45ed1d99fb68fc1540c58a4a35c2b",
         x86_64_linux: "77c1856c9aadf9ccfc61ec2e3ff658922fac7d26628bee457e83947637cebd26"

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
