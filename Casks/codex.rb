cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.122.0-alpha.7"
  sha256 arm:          "9be0443761e982dac28ea3e95afd5436505b976f3a8c9fa117c7369d9b35a105",
         intel:        "028e8e8c68eaec21c50807f238b00f1df17f3037e344198d51642834107bc8ba",
         arm64_linux:  "5b2f899490aacf29c53530e3782e97663461820a6984d6200ee4697c2a2cdc3c",
         x86_64_linux: "1312a5f52d5e65ac3242328ec2c22a52dae1491a42b954031e6c7be5705a5751"

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
