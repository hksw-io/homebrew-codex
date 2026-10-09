cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.4"
  sha256 arm:          "f63ca8937578728b75c0945c99b6a9414d440a53149320912521733e0b7b0db7",
         intel:        "037a9ff1d192d79c967d532f1c97658bf90b7b77cd13125ed34098a8005269b9",
         arm64_linux:  "c5f3283c08dbbaae9bee1d513270ad28c1ee80685634615fb087bf44fd85cd72",
         x86_64_linux: "29e88ee5ab5fcaa933e4abda44d7b5b0924c6d4fea0a2646686a056fde03f58c"

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
