cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.129.0-alpha.13"
  sha256 arm:          "6583ebb3a830ecc9731a11ca778e096826e96711dd988991aa2680041db7ac2e",
         intel:        "3040d9ae1595d1670e89225cedc05c8f0c2760ff7ca566146b602d1200b9691b",
         arm64_linux:  "433e9c7b2efef6d3a1f50fb33acc6ce626c5709b19ec5544d2f4b1a7e5ee57ff",
         x86_64_linux: "566dc6e21dd455aef2ba8bbc35f284d1dd9b57bb39cd744a8d121866aca563c6"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
