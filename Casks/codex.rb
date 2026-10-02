cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.161.0-alpha.13"
  sha256 arm:          "b073e6622d83698c8851740cf84a067fcd6294bdb631de1a7af58b9f22502e1e",
         intel:        "60aef90dd9250da3dc154782a20e0508db67727a341d123a1817520c3df07020",
         arm64_linux:  "743f13883db14331baeb89bad7fa9f3c89f355288c7fa96007fbbc1d6a7da324",
         x86_64_linux: "9a4b5a90658a88459ce4f6d8e43d4200d9bce31d65e78746ebeb47f675834523"

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
