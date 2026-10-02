cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.158.0-alpha.11"
  sha256 arm:          "b13325667743ee62e0cb6ff7389b0950b3d88514c3b992984af79e3cdb5c1fed",
         intel:        "d4d919e88ddb12a5c2558d1732e108224785a1399619c0c6542a065e0fc01c87",
         arm64_linux:  "2f4704fa24c06d1cadb2feffb926712775470d8ba1f9cf50e7120ccc314f1d7f",
         x86_64_linux: "5283b99ce19a9370a0ba6ba6eabe783b63fb946fed1e486916c5ae012cdf93e9"

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
