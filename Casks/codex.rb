cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.169.0-alpha.10"
  sha256 arm:          "aee885b0fbbefa877d4a32a4e3c22f32550f9891521dba6c9e9fb043798b6aaa",
         intel:        "69c97d5df5a8af3af497a4474102d7cabd4fb913720f17af15f113b129a16ddb",
         arm64_linux:  "dc1f9e982f306edc0a1514251c1fcd38760d0ad4e48ce1f8729a98c5ad50142a",
         x86_64_linux: "5653c2d6351d886bb9b4c953ce49e95b0419fc4fc9ed9062eac553b02cd1ad04"

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
