cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.165.0-alpha.3"
  sha256 arm:          "1a6988f838d20fb79473b380def8fea0b22385836cb869bfcff9512d74fc6c66",
         intel:        "7762fb94868275635b41b865fb5bbd0a192517cf255ec690c0c26c95050e4213",
         arm64_linux:  "2152b4ce29d4ced3e1eff17fe2407fdff224add5b9d0d5a6e7fdb557d01197a5",
         x86_64_linux: "83dc0618fbf3aa3bc6a63c3e2c88eec856f911458d4358a2605856c7a4f2b2c8"

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
