cask "codex" do
  version "0.133.0-alpha.4"
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
      sha256 "609f8cab2b15f934eef2bc2652e21188e4160f109d2ce1e7a57e7ce2238853f4"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-apple-darwin.tar.gz"
      binary "codex-aarch64-apple-darwin", target: "codex"
    else
      sha256 "1a778ef36c9b2eb3c20c8b745fdc47bf0c85519e132820f9368b483db326482a"
      url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-apple-darwin.tar.gz"
      binary "codex-x86_64-apple-darwin", target: "codex"
    end
  elsif Hardware::CPU.arm?
    sha256 "58feb7b80b8905f86d3db7dd1a4b40a68a7155f43f4cfd6ff221fb3d82adccb7"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-aarch64-unknown-linux-musl.tar.gz"
    binary "codex-aarch64-unknown-linux-musl", target: "codex"
  else
    sha256 "f6b31f4b8d02f28aed13a700f726243eaadaaf4153f68e5c2b84676e4dd7d73e"
    url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-x86_64-unknown-linux-musl.tar.gz"
    binary "codex-x86_64-unknown-linux-musl", target: "codex"
  end

  zap rmdir: "~/.codex"
end
