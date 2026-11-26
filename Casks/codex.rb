cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.174.0-alpha.7"
  sha256 arm:          "296cabf60facb24b2a5df19e21d3f9d534271a1c9516464fc55b2715cede894c",
         intel:        "b263b19d587f39e88f21753d0f952cc6e44f423a515ff4339d31983405b69bfd",
         arm64_linux:  "d02267bc9099aa472424c7dce4596a8ba09775bf4d498df2742f4303c9b0413c",
         x86_64_linux: "76f99cb9aeec311d4130a56d6f6c462a74c114ff293507011bc428eaf1d453cd"

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
