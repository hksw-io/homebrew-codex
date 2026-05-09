cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.2"
  sha256 arm:          "20617cd5b859dede0aaab6b105203ef265b512320056d8e7d0479691da95d272",
         intel:        "e3027dd376364e38589fe9e5438bca7e7a765368ea13040f61e1112147b405e1",
         arm64_linux:  "f7a04866036cf9010906a4e5711cc2ecef6172d5cb587da2b8bd1ce6793e3fae",
         x86_64_linux: "c888c18993019ac514a1b74d046fb3355ef086ee22b923af62b9a692a36f5fba"

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
