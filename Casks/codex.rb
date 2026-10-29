cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.166.0-alpha.6"
  sha256 arm:          "6b56b43163c19b2f0944c3fad87806db5719477dc812df19fd49d8288c26f473",
         intel:        "e1887914185b0c2f683d1b69f9408d9c5912c133b02950ac8be046fd91755a0d",
         arm64_linux:  "a2ea754d1ba5ac045fde941543c88ba8ec19c91d937b000082d97715d45de0ca",
         x86_64_linux: "eeebe61765c5c57cc6eea806883eaf944fb1a83c8d79177fe19f609dfd01f22c"

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
