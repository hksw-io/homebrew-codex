cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.11"
  sha256 arm:          "7b797a4545ec0bc351d86a50b2d5ae8bcb769d2118741a130e319413a741b538",
         intel:        "e04ccddbb6c9d9a6f653d5b6fec39d0819501174442b2f92b72ab43535c0921e",
         arm64_linux:  "030a1f87985c2a16c19b776afaafac7045dd43a1478b7f0457a58bedf5bb8933",
         x86_64_linux: "7094863d70c84413e1fa1be5ad38b5aa6132060fbc7ff60b5122bbe95d0660a3"

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
