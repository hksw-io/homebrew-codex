cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.0-alpha.10"
  sha256 arm:          "becf06dfd3e7825f9e70c7827bd9726a29cfd0a3a225e312f20fad2d798a5b12",
         intel:        "4762bd348b73319095494584add9d7de3dd98146aeaede2b99ef2959a459d44b",
         arm64_linux:  "eaea022f02e33b394e8f000444b63d2186b381732d7fcfadf597562a56143f28",
         x86_64_linux: "69cb993974c6d4d241aafa7844ae0100fbfd47a1c8f8c75883703d105e7911df"

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
