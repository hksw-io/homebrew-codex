cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.153.0-alpha.5"
  sha256 arm:          "0b6960a0d24b7ba6c437e3374f8b67749463b447140c57c471be23febbcbc731",
         intel:        "3e1d0897de8fdf651188e412d6e77e0addf0157e2a620a95e51d5ad29353ba67",
         arm64_linux:  "5be7b4b71950d534b9de78e369363911fddbcb79229c54cd76f59dab18f7e4c5",
         x86_64_linux: "47dafc2c24fc4e3e858094216ffd1648a9e76331a30e2af358b8d2a9a4ac2bf3"

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
