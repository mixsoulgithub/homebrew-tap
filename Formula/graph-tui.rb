class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.13.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "6f42b0dd23d1cfd31a2a0a61f2bbb237b50754d5a09a454136acc45e1ba346d4"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.13.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "1c7386dc6fd2d8386169bb935118db71d3660889be7079a30c5e744aaf47d333"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.13.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1a1af5dc85bca1b0050014a64143d88ef4a5ca545418bdb0ce897eddf172676a"
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
