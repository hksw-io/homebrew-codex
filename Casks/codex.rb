cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.9"
  sha256 arm:          "9a625dfc6d1b8fe8cab4a0098f2a56acb89585c95bacd7a8ba7514c6d346dcf0",
         intel:        "df19328cf7fa0596cc4943bd06338645f8a5dead2f4801087bc868c8ab38d8f2",
         arm64_linux:  "94f034d97aff37a17993d692bb8c0984cc545d8d82bece9be44567f213171258",
         x86_64_linux: "250d4f0891232cc29bdd7319e68d0bc749b5a090be27eee94c2f6ced8ce0837b"

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
