class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.4.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "e68285cea6c1edd072a321b65d00ec7e728ef895250b40949b325811c10b80cb"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.4.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "9b131ef63a682bd3d2a63a62ab10a1d831db2d5d44947ef24434efa41e3a5cbc"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.4.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "71eba45f1e57c65966fba0a19ddc7b8e5d694912fe8996420a189a6537821815"
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
