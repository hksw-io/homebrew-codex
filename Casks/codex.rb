cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.160.0-alpha.6"
  sha256 arm:          "4cc0e6097446da9942be8d88184a12171068a2b647682007d53dae3e1c466597",
         intel:        "ba1e644a1364c7f8376b9d7d3c6c7740ca7dce56ca0e295fb8e222d2c23e109a",
         arm64_linux:  "b513050c66ab30b646210980077e82d313edaf49ec05df15258ea22f120be495",
         x86_64_linux: "17514ecff012b0505df5c35ddd0defaa0071ac48367fab39b9b3f727a629e34b"

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
