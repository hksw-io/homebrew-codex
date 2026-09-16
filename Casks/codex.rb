cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.13"
  sha256 arm:          "e0b2d6993df5f454a60497c5a9c19a102c1a9c0a46b6b9c018314b9ba5573937",
         intel:        "b0fa2c0a2979fe60aaabbc35bae5115637b12b69ecf5d0eb2a86a1c1befe17a6",
         arm64_linux:  "ca0d19b56c1c13a1cad872270be602ed1e4938b11be82759038c39122e8ab64f",
         x86_64_linux: "9e03005649e1c912e8c1174d7d46a4ba6daa9bd28284b121ed9431fd9c45c3a2"

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
