cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.153.0-alpha.1"
  sha256 arm:          "51977f7566041eae579ecd765d6655a5076a962d7170ecd1c91b7e87a3a304a2",
         intel:        "4ee14cb55a7c1bbebfe345dbbad999cc960d38a59ed80a0e4b71671512acf5b5",
         arm64_linux:  "496e04d38aeaeed8a6846d54b002f286a7a0177da20c2622417a72b1ddc3768a",
         x86_64_linux: "0dad2c070c94e87641f0366a0d38b7ad247073d3b3f018641068297dcc24c21f"

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
