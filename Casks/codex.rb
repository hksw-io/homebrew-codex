cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.6"
  sha256 arm:          "888faeb76ba7d69ee952c499a3b9c335daf5563fe8890717397d1ef6d16d86df",
         intel:        "f2f5c49477543a4a65d496869e80dd6d360da2771ccf7f6e9225a1b347fff8ae",
         arm64_linux:  "769b599b7774e89fae29eddb62edb8cb51b5361bbd0b89569b534b036b36ddb2",
         x86_64_linux: "f9743bfe7650a480c3ae1a8262a585e5ae88f66f498104b4dbbd57d7a5ad4182"

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
