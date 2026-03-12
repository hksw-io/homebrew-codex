cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.115.0-alpha.7"
  sha256 arm:          "9f14cb6d1a43316d35abfbce0487c6e09f0a42e327488e800f7762ecc2f32753",
         intel:        "9018bfffb51eec0880ff34b264f60ec4e0dfd1bc705b437876f2ef398e39a61e",
         arm64_linux:  "b8ebb980fbd5f2cb64ac6fd8b78896b2b9ba5bbf495dc73655e2ea60cc359f56",
         x86_64_linux: "2a67d038c6a1d2da8dc2231e6421f107658b88ac9a5d615cdb0454ecf28765eb"

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
