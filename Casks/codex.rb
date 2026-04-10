cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.119.0-alpha.32"
  sha256 arm:          "1501f00d27d717c0d2f4230bf18b86aae2e4f78d86ad84bf3d7a408236860f11",
         intel:        "0708239daaee5ba633697d98f5ca9cb7f136e49028f6c64a76d4fe4e7788abe6",
         arm64_linux:  "287f2078729f6cf851b5c2da03d37450385eb35a95831736205da6ad0af4265e",
         x86_64_linux: "e3d08f4a47ce9475a9e6df71ab99683667a381ec646ab70fbb8c67bd9026328b"

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
