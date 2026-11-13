cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.2"
  sha256 arm:          "77dd893a462ce0b986c5f0a3c993266c881f6dc90c4b30816260252ba48adcd8",
         intel:        "0ab19ccd4b4e2675b40e1d30689511d5b69f73061254a23e16889360f782c53d",
         arm64_linux:  "209c02c18a629d3caf9450833c4aa8cf6ee3d9585a81680d0f5f0a0d79d6f018",
         x86_64_linux: "8455b03d1d618dd010fa351cbd3349856f5af784a6ab86d9bb4b4b23d2228bb7"

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
