cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.169.0-alpha.11"
  sha256 arm:          "126661607ee196eef789a147007ca9b2bdad3bcf7cb28d5e736997f6ed6dbb75",
         intel:        "12a7b76fa89ac71140efda5ac9119471172fc8889d35388a8d0d5283eca244f1",
         arm64_linux:  "f8193b8dcbea83ca124557a56657f2d952e9ab5840b5304d47be3f3ee7a8a835",
         x86_64_linux: "3ee79a68e9c21ac51b218f35037f462ea10d2154e94b7d280962d16d5c361437"

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
