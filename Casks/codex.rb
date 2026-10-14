cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.11"
  sha256 arm:          "eb0838bd5a63e3bbdf94edd373b9f70875ded01516833339197c7f7d95a01ab3",
         intel:        "4c16925d1fcad10bc1e718d3e6bdfb73140d2da654e598eade8413db7cdf06de",
         arm64_linux:  "3f49a7fa1f4156c98d61080bcd9be48dc83b6071d9af6672432ef70e653149a3",
         x86_64_linux: "82cd812737404747562f9231a17d55e55a75647715dfe936b95fc067653f80c1"

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
