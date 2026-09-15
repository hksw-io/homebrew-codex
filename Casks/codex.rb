cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.155.0-alpha.3.10"
  sha256 arm:          "0280142639c72def533581e0710c01be3b9fb5ca07dc8e9596ab03edf06a8aac",
         intel:        "80e0996f053d009ea0dcf3012911b18a363b1b19a3666c64a2de5388814d5115",
         arm64_linux:  "c792a1b3e35f879f992606475c8b6799fac0406a22c440c39202c7b3b3579c2d",
         x86_64_linux: "624dea3e51c877384a534e482afc0bf1f857a0c962d2326e54f2885e5b84a993"

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
