cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.9"
  sha256 arm:          "61316c60f26b7ec51e2ee12ff63067d4d65ca7929d2e8817996a6f2e98060667",
         intel:        "68aac1e47bbb7cada517999a7e217c734dddb53b405ac4b77c3d7ffccf8f4ce9",
         arm64_linux:  "28792bdcd37999581760937f8a9218b8d62f260a7dc17117ef7590b7c3e427a1",
         x86_64_linux: "126149cbd3cdd742000a5377931a773ca92a13246e13609ce858c85cdb7b54d1"

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
