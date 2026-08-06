cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.13"
  sha256 arm:          "5abca3a4597a5feed95322271eb4a6b5ccf97aeb2a3d51ea3d4f1f34a1d37cd4",
         intel:        "ddd16587d0495f2ae44d55b0305d7cdaf457ae03a834260dc5d4045a2da35ffe",
         arm64_linux:  "ae9bcb555195466f6dbd845af2fb862fed4783489b676fc75ec98941de73ed3f",
         x86_64_linux: "72e9ba34d61b34c06afc6ebfc2cf80a6b92453bed107bd004f66c47e346826f2"

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
