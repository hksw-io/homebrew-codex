cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.9"
  sha256 arm:          "6cdac1cc85fd442132b289c597af1007836f08aa955d5d8f66660bf91e408c4f",
         intel:        "9564e728d6070410ca5f64a2f259d13615a03926c40cf5dd61074c0cf97d2bf6",
         arm64_linux:  "172974b15d32a469c5a384da477c86657078ef59fb8cf214e460c0ff0e3d3038",
         x86_64_linux: "02361973e33dd3130e0affe21382e546331a94d04db07b7ec8f53af8498ccd69"

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
