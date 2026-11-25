cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.6"
  sha256 arm:          "a72256825dcf6a377fa6d24352da096d0507706442ff553075280e851e2470f4",
         intel:        "a564c8e7249d210fe79c442094fc92944797d91bc6206fdae9036017a4231082",
         arm64_linux:  "561c8624dc9f0e83f9b7c594796eee6425837fbf8dd9b34857e44542bd6a40be",
         x86_64_linux: "4795fe548de8aa39ae7990a75f9dac1801de2de5908e1754706c3d2e7e26350c"

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
