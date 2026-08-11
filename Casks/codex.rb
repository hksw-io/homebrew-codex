cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.7"
  sha256 arm:          "99bd0fbf36c72f7628f7190fe6affa821dc56b6c0e19957af4d3ff796573899f",
         intel:        "901da778560e3db446c2350593f6bce5bceff884dee88a303cf282cf560789f1",
         arm64_linux:  "aed5bdd9bc61b577a30651d97264617e4d8bc118d1421c6399ce5f40d4e9d0e9",
         x86_64_linux: "1fe3a546f73d085bf39cb6a942ba47237f70ce9f7e8566bfea52968babbfa59f"

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
