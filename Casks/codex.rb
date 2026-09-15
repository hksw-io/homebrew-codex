cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.3.9"
  sha256 arm:          "2e4b0f351952491b51aba6976e76082b094cf80340dd54af44b115ce53f81143",
         intel:        "40c036f43f54df2cd802a5d3622268faf80c58dec94ed0ac92d1816c483d739a",
         arm64_linux:  "f245ba7bbdcb20042cb04f34ca9783c14f9eaeb7ff7e5a6a2249c664fefba27c",
         x86_64_linux: "145a7aeb92035efa51858deea586990b38bba51e70bef3499d743c5111d58102"

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
