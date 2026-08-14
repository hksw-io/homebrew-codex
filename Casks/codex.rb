cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.15"
  sha256 arm:          "840908939508e8b30539801dfb797ae0431b99a69848b6d42df173457c0c6c6a",
         intel:        "cc7a57fdfdb639df80067140c28ae382cf2a0a27c0df1d1f46b179988eb47bed",
         arm64_linux:  "e160fd56c8d22b0a37b7adeec920ad2325eb71a51204201d791f9238a67b1703",
         x86_64_linux: "0a1126d97fe1cdb7ae3fbc2679af82defe282766aaafb0d0017cebccf3b48e71"

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
