cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.7"
  sha256 arm:          "1cd2b9ba38aad2a1bef84708b47fd10cff49f7482152d1d3decb4f58f04babbd",
         intel:        "890ef794182b17001cffa10859e413b98c561271b6d779994022d4750e68c310",
         arm64_linux:  "eb1112dadf1b33c36254b66d6be591ce510fd8e2846deb8890fc12946df29f13",
         x86_64_linux: "f72269af2f58e5013cee89a387be9c7ccdc20cb45981b20dd75a42e0ca441b1b"

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
