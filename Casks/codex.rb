cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.1"
  sha256 arm:          "c7fbe5a4d266997b399755ad96a202ad5e8a4e1f5cfb9e818eba0639c248f898",
         intel:        "cd7fb5d5bff8a515b553a6a0a34d08a2e06fdcf4d85e0590ad360ebdd8feb194",
         arm64_linux:  "7f07bc2c75c80c3d9e5022eac59630f0d50e19f16312cc212ea6b7dd38518665",
         x86_64_linux: "3d29fc682ff9e846ff22b96e272fb2c61cafd5704d2a7f3c6d600f612dd7c558"

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
