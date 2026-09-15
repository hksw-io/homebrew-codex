cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.5"
  sha256 arm:          "375b883015b2be2938ab8aaf1fbe01e2df25be5bdbf70295c1db250d12b8af9d",
         intel:        "f3dc68a731da04bd6c89dfcd5bbc2df0838000856444709c273acacf918f161b",
         arm64_linux:  "90a8c338a9a6049575bfaebe79a6f6da6c2815f900f1104bc91cc85a3768a042",
         x86_64_linux: "14c5ec6d5337e5c2157cd26cc1e0e91cb92df5eb7401c66a262fed80b9052fb7"

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
