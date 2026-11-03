class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.6.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "140b6c15822aea91f6d244a003c39d23f25f5f910f0e3c9a1fce19113d5b4c60"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.6.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "a2e13c1db35f8be7dc7a7cdce450d80c3fbdfb08c12610c29d83c038e85e808a"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.6.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f627d17b625d605001c3f4fe01668472b3f1ace03d07ec7029b0e6c9d9a9ea57"
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
