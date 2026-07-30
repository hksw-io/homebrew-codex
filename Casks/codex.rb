cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.146.0-alpha.14"
  sha256 arm:          "6c6cc6fb3ef1ebb8cbc76fd8bbfc7489f04ec421fff5daa855dd4844455d8546",
         intel:        "d4130d0439bac40932d363ea247b86bdc2759c92e419ae496c1e04c5ddc14805",
         arm64_linux:  "28f2b3a0472ea56bfd3f6317e3de65b68636928bb02c6cf53a05dbe5ed975763",
         x86_64_linux: "32d012b55306448c61d0de3db7db3a10eef6a9257b184dafad02a5e63530c6e3"

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
