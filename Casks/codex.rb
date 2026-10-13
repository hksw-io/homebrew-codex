cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.8"
  sha256 arm:          "65e4aaf21daaf52c6ff603a40df8ebc44641103cd27c746d7d4e8d05f44bddeb",
         intel:        "395adc8f9e3a7db75509058733e557399de377b635c09003d722b606bf9d1224",
         arm64_linux:  "53786a26cc1968ece07b4b4f9defd99068ddf425d687bef3b9a156e9d0950ab0",
         x86_64_linux: "cdfa3eccc59604f8033417e37053a3881977f9e2c49f29fec6b74485cbd45832"

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
