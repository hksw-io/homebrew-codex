cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.5"
  sha256 arm:          "3a71856a35857db1a87d5e6754acad6f24cdb3deafe92d852dbba13cd0afa713",
         intel:        "f93a5fa00d32cf333179c3ce9792cc2b780b52978c05eaaceecaa10923730205",
         arm64_linux:  "efbc77395b818d0193474d20451933f20e7fe3a8b551e0111c0120f9cedc51c8",
         x86_64_linux: "7a1db10142f82f564909335e0ae468aee8018da92d8a4948ec8a8a09022a2a4f"

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
