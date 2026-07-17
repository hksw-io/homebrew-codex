cask "codex" do
  version "0.145.0-alpha.23"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url "https://github.com/openai/codex/releases"
    regex(/^rust-v?(\d+(?:\.\d+)+(?:-alpha\.\d+)?)$/i)
    strategy :github_releases
  end

  depends_on formula: "ripgrep"

  if OS.mac?
    if Hardware::CPU.arm?
      sha256 "df64b21f936eb84f2cb3f610b70ce70e97f9038bdd6cea5dd8479c4eda76f46c"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-apple-darwin.tar.gz"
    else
      sha256 "7c798e8371f283532eb12631f1acb2d84f2aa908bb39666f4e1e032e9d65a8ba"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-apple-darwin.tar.gz"
    end
  elsif Hardware::CPU.arm?
    sha256 "433ca9060871a6fbe9aacfec39e6e000a64b6e5b6badfe11c2ddb5171a1d2dfc"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-unknown-linux-musl.tar.gz"
  else
    sha256 "051e1de92f31216d568e43e4a6cd93e22ef262d3f9ddfe3431e1a3e2dd24d668"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-unknown-linux-musl.tar.gz"
  end

  binary "bin/codex"
  binary "bin/codex-code-mode-host"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
