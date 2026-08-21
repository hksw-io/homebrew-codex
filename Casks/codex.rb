cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.150.0-alpha.6"
  sha256 arm:          "d8187e3986bfbb20756d4ac3e2e362c6dcd198a2143a63e7279c1d41a3a8c737",
         intel:        "81673e4bb3acdfb417442a4c9450efa3f0e77d4d8173b5c2e25f9ade8d2d951b",
         arm64_linux:  "6e0317ccc91282f9f84a81aa1605129d020041418aee9307da605348c8fedf32",
         x86_64_linux: "b96315093590f1288beb5da6e7ce3a89b59b92669d95354a832863e763dafda4"

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
