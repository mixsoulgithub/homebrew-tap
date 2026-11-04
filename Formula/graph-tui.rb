class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.8.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "36b298817e172c2b2006c2355d5c3f35d5fd3f9aaacf169ca55e683e4cf79d8b"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.8.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "4477b19ebcd656670662c574d27838c4c1833012e068365e7270774bb4c755cb"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.8.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d281f7ba485cf2a94fa129d0c88c7628769d4498d811dea37528d04adaabca28"
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
