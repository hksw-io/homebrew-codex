cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.162.0-alpha.4"
  sha256 arm:          "7a48428c97ffd8cb5f76a4459a91dad48672db7b80bb8bde39064d1d7bda771f",
         intel:        "1bef7ecd01c04ba172f31d49ad370f42885c36092ccb07ae1669a473f235eaa4",
         arm64_linux:  "4f4cae45cd2dab1da991c793aa1245ffb510905c107eea4288167e4a483a89bf",
         x86_64_linux: "f151235c81574d9ed6ac43c371820dd378d525a346cb891630be1cfc9d44941e"

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
