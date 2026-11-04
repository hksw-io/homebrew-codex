cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.168.0-alpha.1"
  sha256 arm:          "5c704d9259a24427b4db77c2e8dfc2ef335efa5df51750f12fe734da6712f00c",
         intel:        "a65b22cbfac11e8557f90de4b7c30ba565ed3ada5a4a83eb29c9eb10b3944a54",
         arm64_linux:  "bc3ee54ad0b567cc975a4963def2c36eecf52a8df8ed46e3c674659feb549fe1",
         x86_64_linux: "17be8af4f72f131b83343c5a65797df4581f3f66b60bc67cdda05216fe22f2e8"

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
