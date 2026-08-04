cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.147.0-alpha.7"
  sha256 arm:          "78876c71ec983399dba2832e5338569f6c75330bc6f3a7ba9a644d0c4fe8816d",
         intel:        "0c04aeafdffa8a06d94b1bb6a69cc224140ff38726f3db4b314cf20607c92acb",
         arm64_linux:  "8642f82a3f60eea4bace8fd31f6fd704e32564a4d7bb5d447a219a3d51b5ce80",
         x86_64_linux: "cc58fe456c8039a1446f5040f95c85de628d1c0ab49f3f8636ad5646c5acb679"

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
