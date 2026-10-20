cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.7"
  sha256 arm:          "34ffc933fb9e30de701e5c760fcca194d57389b5c18365164ee0376bcd25d103",
         intel:        "95b1029d7cc353ce39943cb9801d1343d4fdc41bdba11625a149847643cc6c55",
         arm64_linux:  "21288b82854d0a51523988fbc1c7aaf69541889187d370102f4195af0a19ddd4",
         x86_64_linux: "647815b768d03506f9c59f3ce3dab075a11015e0ce948f75259b712ea578f74f"

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
