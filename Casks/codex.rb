cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.152.0-alpha.5"
  sha256 arm:          "3246275e25fa6e7fba056471c137707827d6b2d94c67d180be6b3ae181447f97",
         intel:        "164bb2b0f09d415ab4126b47b413f4be96cd503f336075d9e6a66c83d3267adb",
         arm64_linux:  "3617f8694695aae97d9175a9ce76cea989e60403603ba95eecc22a9a34118ef1",
         x86_64_linux: "869b6c0f35d20cf78c54f98c4e5bbd21b7dc44cff98781f2330c444b0f0327a2"

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
