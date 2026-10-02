cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.9"
  sha256 arm:          "44a2dbfbf866d6b66c00b8bdfc91f5fa24ccdab1419389738cb009c671cbb83e",
         intel:        "58f226d844af226c9364b9c9a01568d45caeec8ca1ae7c9867706a012457d240",
         arm64_linux:  "b91c8028c17a701bb991089cb8d55afabf5bef2cefa76ebb33c47a7c5711ed10",
         x86_64_linux: "525da23644626f3a1cda0f67a43f1fe9f2493c74a89c29bef73a59f7348ced8f"

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
