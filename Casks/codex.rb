cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.5"
  sha256 arm:          "168529c6d03f798073acb73f89e4e79fd1f2b6a701a0cf5b29e5b21339881597",
         intel:        "646500979aba16d951908b4b3c04d20e73abb46b726d3952d728b5ea0333b8b3",
         arm64_linux:  "3174ebc916ca507b0b0e4ff0eb9cbfada427c5d7da276a1b209bed75fe9413f6",
         x86_64_linux: "32f13e7f62a70a101004c2493083f1ed51dbad05e8127cd681dbe4931495f203"

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
