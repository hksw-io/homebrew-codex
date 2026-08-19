cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.149.0-alpha.1"
  sha256 arm:          "58dc9d143651f5c87244f3a2083b2d9235366cab10f58bb30f48f46ada0c019d",
         intel:        "21c27c1e97ee563aaa3242e4e42dde2523fa587ce15087d3368de6a7f05de068",
         arm64_linux:  "e9fcfa2b9fea9fec216c1d2b24d0dc553039f94f11ed99ff76c63aaa060c6ff8",
         x86_64_linux: "63f529706b94f433dd23d4713509f17e9af222136fc6d8eb3f79f58754e80f05"

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
