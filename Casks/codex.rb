cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.12"
  sha256 arm:          "316012a09f53d754d758300628cdccd36b9e37361c8eaa17b1f5c2fdbb343e37",
         intel:        "58cefc6b5a4c24f17fb72e0372e87f079e094a4f3a07d48d873ecc19aea44d91",
         arm64_linux:  "a5314a719f858b1447fdafe445e00090953ec8a1851e8c496f31979f7d42247d",
         x86_64_linux: "0da0fe750ff18cee5dc86aae86ed002c7cf8418a5bec9ad4956f82fda60ead24"

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
