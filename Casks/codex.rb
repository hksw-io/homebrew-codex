cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.130.0-alpha.7"
  sha256 arm:          "0aeccbc509ccbacb4f30a6a70afa775aaf8da8f5753d1728ce6d2aa898b23e0a",
         intel:        "d66c5a4e40afc98aa66c0104ab9f9a111fad38c1d66ad87a714f9bdb1f2fbc40",
         arm64_linux:  "2b46233356a4785c97e4843875357b3782fd8814a604fd605c524c2e1f9050da",
         x86_64_linux: "dd2533891b3a335203cc0c841bf9c1fdb503eafe0d02cc9ebc2394322a161f9a"

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
