cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.10"
  sha256 arm:          "58c2dc804b79fccaa7c76020e8ae4f744938819ad65ca87a5c1a219fdc5c53e5",
         intel:        "03b6f77ea062c2b320b74f748948159a66292f2d6b1ecb8fe5bbabfee18415b6",
         arm64_linux:  "d68869ef53f71a91b115986410664bfdb9b33b03d46216380114f8047740b661",
         x86_64_linux: "58c484db9365d51f9407a77e85eb9a1229019906a34dda4661019476596fb8a9"

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
