class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.11.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "eafb09b02b23c01245af32de857bd23b4a08bb800d1174173670da7c27a81ec0"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.11.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "92aea4dc9cf98599efa164c89c4343713eed12d9fc91cc3ea9eff162a865a01c"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.11.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ac798a323f791907c0e75b52fdd4f2cefc56a281b1d8f693dbe6321a9173c9f1"
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
