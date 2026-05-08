cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.130.0-alpha.5"
  sha256 arm:          "0e3f8d3c9f4c583dab38c3633acc97227210f61b72729e074f90cdbdaae0ec61",
         intel:        "2f7da6f717ae3302f6958242d2597e926d43a3595e2476572f076aea3f56f43a",
         arm64_linux:  "84d7c300cedae8c117131aad65edab0c0e8dd50dedce7d8f723bef63b89e378c",
         x86_64_linux: "d6925eb1a2acaea0c5d90e77945911f68c42e3c78215cc76cc2676364d0268a2"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
