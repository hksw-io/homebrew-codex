cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.148.0-alpha.2"
  sha256 arm:          "7cc1145444d6275fff89eb4a5d456273760443b9d5088b9f822fb2564c6f5b2a",
         intel:        "8de4af1cfedbe6a10929843e361feed20eebf40a7a9ca2f6f700e057c62ca593",
         arm64_linux:  "768b4026f0a4ea004a533c5bc09e82a0ee3fb7e36b9bf412ce69d54833e47aaf",
         x86_64_linux: "95112e4ab5e3b07cb010382ab4c6a96e2b127b00a4d6d72390a748e7106ce652"

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
