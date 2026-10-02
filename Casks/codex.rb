cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.157.0-alpha.1"
  sha256 arm:          "45e7d281495499cca341560ebb12a133e259b6385e8d61b91fca0071b8d06ac6",
         intel:        "a2d9059c2684531b781ef4877eddef9d3b0f3447b177321354aa336a178211a6",
         arm64_linux:  "b9c599d2d897e504a96ccf5a8fbd0b126ef432892977529a9e02176d9aec6fec",
         x86_64_linux: "5839e68ea2854f4b8c1bcea62f8e3348d27d55d50d1e24e044a40ae96cda6fa8"

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
