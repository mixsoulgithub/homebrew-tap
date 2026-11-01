class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.2/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "f87e399361fba5124fe0326240dc920d4d79f24ba8ce7e483a8167d7c6db0a93"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.2/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "2aad35f389431b42cdb70308f4cae5e88b1ef2da60781fae1548135a9a09172b"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.2/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1f5ddae874db4b38151acc4f145264c103604ca9f17ee1b1e10236fa3a6c5eca"
  end

  def install
    bin.install "graph-tui"
    prefix.install "LICENSE"
    doc.install "README.md"
  end

  test do
    assert_match "graph-tui #{version}", shell_output("#{bin}/graph-tui --version")
    assert_match "usage: graph-tui", shell_output("#{bin}/graph-tui --help")
  end
end
