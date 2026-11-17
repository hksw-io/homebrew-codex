cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.171.0-alpha.12"
  sha256 arm:          "c6c819490d9fd81a2cad0171348825218b8ada046f9760eac51969bde28e674d",
         intel:        "26a8ed27dfdd8cb3d2f7cda45497798c214aa28ffadaf87f13e569281c856f10",
         arm64_linux:  "d520ea2cf859996cea5aea7a4e19e3afa50464671b68cb8cf63cb35fb7866b06",
         x86_64_linux: "7d567e96462f1e215f637a108f8b29cadba6be37241a9be7d14d1668da118e05"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-apple-darwin.tar.gz"
    else
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-apple-darwin.tar.gz"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-aarch64-unknown-linux-musl.tar.gz"
  else
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-x86_64-unknown-linux-musl.tar.zst"
  end
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
