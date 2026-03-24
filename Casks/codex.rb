cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.117.0-alpha.14"
  sha256 arm:          "60476e5b758f6156d410a59c023218e461b42d120b5b7b38697daf94f6a55409",
         intel:        "cfbbee4b08b53069a032d94ef4dc58e05160b7d6a542e825a8a6addb4d81f028",
         arm64_linux:  "24b07d31f6da1455328ba4d0a14cf47feb6d21f1c761dbc155e138bba5e81537",
         x86_64_linux: "6d9a4d935880f7e77118d62e686a7b5432dd4143721d177a155edf2d4a242882"

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
