class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.15.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "718d7d456bc2b86c1c311da68c062b049398e345001686eaab249c67381d65b1"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.15.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "e6fd069578b37d9ffb836c163e0723ddf3d0760e7489fb5e882af92af6e87cdc"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.15.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ab058f71924fe79366b3cfd3379e7b392f0afd3ad64d9737fdc3fc8b169e23ba"
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
