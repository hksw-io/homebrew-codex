cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.13"
  sha256 arm:          "551ba4dd75c116dab285d77354ff50832b7e4529b88045da69ef3d4643f2b855",
         intel:        "ab72355db3be26dffc933b3979714cdf3836d165025bf1c081e7b16ca5c65413",
         arm64_linux:  "194034f8505b01fc23b13d811317cc4f6c80a93d1e9e9144abe2442807501311",
         x86_64_linux: "d563974c5701c630f69e878b480ca48dc627ec628594b54ec48c0933e52d9a17"

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
