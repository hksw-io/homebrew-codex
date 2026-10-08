cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.1"
  sha256 arm:          "a406b5a1f8d84b9f17f94903da46bd897f98d76bccf1ef522b50de1bd606547d",
         intel:        "340da3083f800d82761b48d19e18bb754141cffcec1d99079423fb7c57dc3969",
         arm64_linux:  "bade4a27fc20e5d1ebad750b7774ae47755c0ff215b17aef00ddfa4c95811538",
         x86_64_linux: "65f8c878b34a74b85fc22f64bd0f57afe1746622d539b42d01b771b0002598f0"

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
