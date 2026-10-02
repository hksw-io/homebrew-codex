cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.8"
  sha256 arm:          "a8b7da21afc66da9bd7312bb9ad177bce89d0ece9f264bb265dcb1e38996d853",
         intel:        "170feab209e30ed98c4c91b1becff706d7d28303ae84868e0022adca9ccb4e70",
         arm64_linux:  "a3490a711566e9ef4bb9c59cd3cefebd71dcaf6656a103fad89b73526a957b3c",
         x86_64_linux: "1de32903517f967936117d758edb838eb304860d14d2eb9de5bc2dfaaf79b9cc"

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
