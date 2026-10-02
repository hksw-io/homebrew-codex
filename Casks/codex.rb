cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.13"
  sha256 arm:          "6d180061503b97c4b35466078e557ca6bab242c8eb8d2f9ad2ee8b4014667daf",
         intel:        "b61d339c5063c8e1d54cd544a857b94866972c9400b690216556df13093023aa",
         arm64_linux:  "81bc8a8d0ed9355784e47e66042a07404ccabf41e7fe657f2017accfcd80d641",
         x86_64_linux: "e417cf9d1be66dc8f8cd03188b8bb051f61be8bcd7346bce371f374b6b76767f"

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
