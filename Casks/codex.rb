cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.151.0-alpha.12"
  sha256 arm:          "acdf8e816b61b8692d8dcec984a07ad3976021ab2f8631c40f60b52cb61f20c7",
         intel:        "245ceb80541bf3a05c55e91786c0ea3879adf80483b8f4eccf8e5138d14cda00",
         arm64_linux:  "f800c589cce23517d0058c74a15563e9c737a7efaf0b266559d62552b56b0288",
         x86_64_linux: "e3103be7e9928db1bbbf2aafafa41b17bc993da32e39ec7903ea3fa5e08ea0ad"

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
