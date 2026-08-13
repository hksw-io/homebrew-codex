cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.11"
  sha256 arm:          "ae3cc992c2d92033974d081d3fd6dc618f311cb3decfb07938030d30ff544f3c",
         intel:        "245082d6ee2d3d0b3c7101a43a243e30fc42969eff8a174969dc2149ca4cf638",
         arm64_linux:  "c9d819b16825eaf26bea3f2e2143b3e8dfc24a96e11b9c0b90912f7175649e53",
         x86_64_linux: "5f4db3a38a3a101edec445ee082d6391dfb61d27b55e4520271d5530e940aac4"

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
