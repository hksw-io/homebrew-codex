cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.126.0-alpha.16"
  sha256 arm:          "41313079d155d32a16747dea60b72452ec1a5bed5f30d6c4c07de77b165b988a",
         intel:        "690745d31697f03e16691255c39d7ad89e9330059b652afa5be17777de15abf3",
         arm64_linux:  "a64ce090969603569547bcf0f3b907a7bab43b56bf091ad4c185dfb1b2623e3d",
         x86_64_linux: "5b6f20c0dcafccc397b07dce7013f16df7d68cd897aa5e813b1898ea845b2a83"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  binary "codex-#{arch}-#{os}", target: "codex"

  zap rmdir: "~/.codex"
end
