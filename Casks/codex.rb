cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.169.0-alpha.6"
  sha256 arm:          "317dbbd32bb5169dd3eaf08a231b505460f0b910659e1ab846f6dbf811bc47b2",
         intel:        "c912da8f2c37a26b4051aa4ee9712f69a499e0b8224b4e28f4e371015912e1a2",
         arm64_linux:  "8e622ba3d9e6ab01b40b28a618e0c6d4acb7acad53c1dc0303d469fe6857dc4a",
         x86_64_linux: "2ad32a84adab59d8f141b468c7c92c514315051183bcc9a86f520f1042a4be69"

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
