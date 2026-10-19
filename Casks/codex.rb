cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.4"
  sha256 arm:          "422194553376ac1e2e2d3f3dd0dbf90e5752d39c5779e13b6a2563db6cc3f81b",
         intel:        "c87ccf2286357946aa8d5f36ab721ba2708feb65e458fb3a0770c2f48dcd852c",
         arm64_linux:  "4b335129e3c6d53bb310787583eda69616d3346326e9c28609231e45be0d7e57",
         x86_64_linux: "1975088b0e015b3695fdcc652b229ead5a62abda920933979e19dffe3989f210"

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
