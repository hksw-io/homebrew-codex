cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.10"
  sha256 arm:          "e6efd252e6b0bcbfebfc55af3932ccf457621f413a55dd04ec1aa009cda65961",
         intel:        "4c10a0f1f34a2feda359a8cf8c7d91ca34c9d98d6e93353bedb72f6f3498274c",
         arm64_linux:  "238ac1f31b5e232ae9da77b90c01eb392a19deb4692b3ce9a0e9132751272f04",
         x86_64_linux: "86f4d176feae42165212638599f4e55dc46759f6b5f5571ead3c4d4f7416b709"

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
