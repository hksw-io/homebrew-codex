cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.10.2"
  sha256 arm:          "c94b15dcf139231c4dc5731bb1f1a4c3d54329db68b170870ed8fabcc0db7146",
         intel:        "a0c60836f9768dc61027c79f3cd7c913d3d47c8c1845544b3dc89e1f6c62e943",
         arm64_linux:  "b0b7ff12102f9e6718c2ebf9e5582e6712320bec44e12e7c4621b6aa1816f9e7",
         x86_64_linux: "aa346f49c7cb52d196d504c1aac5f34bfd59289181801dfde37c590c6aefe97a"

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
