cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.123.0-alpha.3"
  sha256 arm:          "81257ea158b883f7c4fcd4a63e1f25fa5d741ddae8e62936c3af138a781af056",
         intel:        "417979592a5bc47e773ccf0e95e8b1d223a7a8c7f7a4bdfb942be7000a017ad9",
         arm64_linux:  "5a80257a0022d126de384d4b0fef1d3f46462b4eb835aedd49f9de588aeabaf6",
         x86_64_linux: "810bda24384edc89f2382145e1acc9c250a73198011cb84821cf9ffe3d9e2f04"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
