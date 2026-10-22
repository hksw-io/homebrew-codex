cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.12"
  sha256 arm:          "2b528d24d14f7d5ae352a2ddc8fd87a835392f645e48d218a83840c96a4484e4",
         intel:        "b27b3db2ad08e23a7d70858f8b864e94ca5182f9404467b7b38a24d87f9003b7",
         arm64_linux:  "27bb87dc053ca08c972a848b64c761faaf696ba2d69cfd5d14400c0cfc9ed0cb",
         x86_64_linux: "68aa95bee54351456b94474413a66c9a02290817d2be9a298c7ac17aa56a335e"

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
