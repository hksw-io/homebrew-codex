cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.131.0-alpha.9"
  sha256 arm:          "1e01ec4c6712a3d12775955c9f41d4a17a93298626eb83655cf9bd382e373353",
         intel:        "43e873599ecad6311bab4e771a00029ca432a33c7f8bf91914c66974d25c1d3f",
         arm64_linux:  "8e873b75c868865572e2fcfc1e64424341bdae9c0e8d05d48a09ebde52135413",
         x86_64_linux: "d1ad1a4d75363adf77a77dcfafcc92dfedb367ae65485e68b1b5f9dfca758723"

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
