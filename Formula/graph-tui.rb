class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.13.1/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "fdbcd913c33a63aaf0c911daa9b31fc0836edb3d873ce78e2801a5d1df67956a"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.13.1/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "33a0fa099d9bd2a2f17afc8bfb077ef705851f13209283c2512af363f5e92acf"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.13.1/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "bdcc296a95c85e25f88641a4316c7127773044e8d94d12510f27769a0ac6133e"
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
