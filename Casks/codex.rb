cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.156.0-alpha.12"
  sha256 arm:          "053898a55aab00b577042d1ade8ff696615259389d16471afb5a363e399d33d1",
         intel:        "74a036ead70ee13788ca2e71922700ab05df6649e02ca9a0d46cd9345615f850",
         arm64_linux:  "52b9c4df5e6898e0e4ca58fc32436d8b7c2d1d337f16a23a35cbd05ebe4bfd53",
         x86_64_linux: "9f0dcff39f7e37805eff1bdf388c2ae16e21dd49a39fb6ed65ff29c65c154a6f"

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
