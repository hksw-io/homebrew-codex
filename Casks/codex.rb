cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.154.0-alpha.11"
  sha256 arm:          "15c13217fdaa4d47f347383635c56b86f5483d3eb4449104d9932f1f7668bc4e",
         intel:        "7a3d7bb681028d5dc91ae6869a78a51ba2319e724badd304a2db28cb89e66dd2",
         arm64_linux:  "7c15e1af445d977812d7ca82a1f59f479a2c0d879bc5b7a4332921cbd95b8f35",
         x86_64_linux: "2dad04b847c4e074d95eb9eac93760c42afe46e083cfc8aa0ae808424957a93d"

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
