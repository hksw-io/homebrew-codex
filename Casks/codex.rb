cask "codex" do
  version "0.145.0-alpha.18"
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
      sha256 "7d375fb13dac77890b3e8f12e3bc41c12fb1da9a3ffe8f1f2da29f1593f22feb"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-apple-darwin.tar.gz"
    else
      sha256 "c399435164309e11ceaff06a3d354f7f0f15088d5e3f52308c0de544ab2c6102"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-apple-darwin.tar.gz"
    end
  elsif Hardware::CPU.arm?
    sha256 "4224fa34e64c41a62881353aa27984d0b84d0fb3ebad46977e6570d47497f834"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-unknown-linux-musl.tar.gz"
  else
    sha256 "17313ba69d9f86b33022fe4272a77e8c685cc5c9d75676c2529fdeda097c7c3e"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-unknown-linux-musl.tar.gz"
  end

  binary "bin/codex"
  binary "bin/codex-code-mode-host"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
