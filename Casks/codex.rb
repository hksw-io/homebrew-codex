cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.6"
  sha256 arm:          "2a304c94b9cc2813dc66608bf436f995021bb75ebb21cfd8bc6053b462c5b816",
         intel:        "066cbf7826964cfe114acae03bb0e6dd3c5410597821c6ba2c695d6b9093d642",
         arm64_linux:  "466de01b82f9799c882c6a9000daf756e27240f663fe322305379dc0deda4187",
         x86_64_linux: "8377a98d8f83dc882723812944337a81303ee4cc121825355400a7e02272eae3"

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
