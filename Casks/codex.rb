cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.173.0-alpha.4"
  sha256 arm:          "6ae4bbbaf7be0a1010313fa00a157b1658cde60fd6d48b0e6a9b67fc443db438",
         intel:        "a08705882d5b3e490891aed5f105c1a5fdb5201d6de2174c8a345cfb19bcd149",
         arm64_linux:  "7d6c331f1c985c2e65e921e0cc1bc1076925a5bf97c152de640271dadffea8e8",
         x86_64_linux: "0430f6cc919d37e5eaf7de41a3a84486ebdec5802e8d75684eed8abbadce3c84"

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
