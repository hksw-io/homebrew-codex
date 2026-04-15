cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.1"
  sha256 arm:          "d30f58da1955c76061ef58da4861ad15d8f487b0da86ff37c73f86cfbaada7c1",
         intel:        "bbc1007fa44d96c69a47efa5bcf798497780af6941776ac784240a616b717407",
         arm64_linux:  "903583bfd808d97045bc46a3da562b65a2d003bbb89a7068f58f100f33d38fee",
         x86_64_linux: "8d22f7f6f46896cbea4876eb78302ac089426fcc9fe5572e8eb5fc60140e7c71"

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
