cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.164.0-alpha.3"
  sha256 arm:          "2fa9a95f655f48eeb7c2e2ac04ffc027d58202180f7e01b0789a3e6ea376a317",
         intel:        "9a20dfb2a1edb9d36fb10556ac94b802775b892816b3c7749f8ef20afd9049ff",
         arm64_linux:  "b8e69eca351df7f432a54423f899d864a1955d01e362b6d26dc43ad8ac2b7445",
         x86_64_linux: "4535d33da4f4a9e4cd9da9611c5cbf1208f406bbb127d173a963c725410fc957"

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
