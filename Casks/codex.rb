cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.7"
  sha256 arm:          "fb67bb6002050f2f62fcd57025e6034c16e4cf1323b25c1843bef1a0b6fe8128",
         intel:        "0f1f0e374dbd4d204ae787021ef34062164d6261ad235241cd5c1c60e127ae19",
         arm64_linux:  "c1f853382697db57e2bb2cd3dbf9e8f9bdbc204bf762e85476f91c2027f1a9ce",
         x86_64_linux: "04010d39bd010c9f2d9568e2899f4b21a8173d0a50fbef6e91d60eb27efbdb93"

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
