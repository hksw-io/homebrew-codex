cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.2"
  sha256 arm:          "7bf804f9a0bb5a7c2148e275b936b3ea3b4b4e26cd767a848993c38725f6b4d4",
         intel:        "b55b5d7071f7f11b787ef918205edf97b2e38338c52f8c1622334cd21db2ceb8",
         arm64_linux:  "f826d26d8992d6c7a99946ee473b0218044a15a05c76b2cd88ac3b797ca8e8e3",
         x86_64_linux: "0f004a04e15ed3bcca181ae56b567d26be7d7d4199984dedb57ef39201c9e1a5"

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
