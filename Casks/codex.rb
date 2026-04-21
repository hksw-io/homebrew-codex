cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.5"
  sha256 arm:          "0aa1b7685d5d1b8a2849b70106d9fb8ad0967c5ba5d4ca3a99f5e305e9972aff",
         intel:        "db5c8425704504c7f3e44d736db97637ebb7e70197e491684f68b50792be6c80",
         arm64_linux:  "13dc2447b4d17433277f21962c24c65c3a2f971473242e6637f210e68d39a8b5",
         x86_64_linux: "9cb63abe27d9688d9ecdc90882fa372a55c1a74be891f0823e69bd938d94bd49"

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
