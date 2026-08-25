cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.10"
  sha256 arm:          "f2cd3258ff97c3c3b76fadc43e25c7b2de38182e7e5b06231c498c151249d21a",
         intel:        "9ff8ef450376e6f9ad992d3e53c91da157de43c485ab39053d94b094d4079ad2",
         arm64_linux:  "fa722071f7274e913c658b8d772528162b9e9369f91b5c3c0c769ea13d8d62b2",
         x86_64_linux: "c1c451e07ec16c195906190546b2f0c876c9dce181644bf5a3df1c8c81a7cc70"

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
