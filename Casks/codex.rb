cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.10"
  sha256 arm:          "02ccc4d97bd07d4203161f8c9988b20449f0fcbf6ccceb5f12ab29612d3f1b55",
         intel:        "b6424c5b1ff6490f3187c73b0a4b0aded2bc4732c70d51f69b14c20e903957c9",
         arm64_linux:  "10b753dc584a93d8f09d05a10de605ecd2309e05a66f40bcf81f2f933962ea99",
         x86_64_linux: "3194d1f498f0023ca6ccd5420d13bbcd46f6c8205cf8bd7f32059409f297a3cf"

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
