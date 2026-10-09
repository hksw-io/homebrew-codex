cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.163.0-alpha.2"
  sha256 arm:          "c629dd75304b3fe104696beb2cee7310da782651c7810569a99e2a88c5b9e5b1",
         intel:        "3f02ee3061e186f899f24e985412a1b3f393111b15459c3adf5ab29da982d556",
         arm64_linux:  "d1205247225aa2994b322f8ec75ba04128a10640f645a97b7af38f199f9d5c87",
         x86_64_linux: "6d6797b024b1596f8170cd0564a695a8035fc2f4d600b1762f8ef7b1dfe1577e"

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
