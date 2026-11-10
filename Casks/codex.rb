cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.169.0-alpha.9"
  sha256 arm:          "5f148cd232e4b58ef03cec9d7e70dc3915953178ae4284db251aee22a5fcee43",
         intel:        "653a5792403efb70522179052f77bd465830d074ef03d9989dd3eb5b4b97f5f3",
         arm64_linux:  "6e6561364ec2e4578dc962f2c3a1df9ee105a21c5a163d4af0f05fc9e43dc8f1",
         x86_64_linux: "eb019e35120c75d15adbc66d45aa2fb3704e933b4d8b050e5fab73090f185b0b"

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
