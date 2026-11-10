class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.15.1/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "0e82f6a4324b2d4f245bb2a6036b0aba4f7ce65588dacd0c41623cf04d6509ec"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.15.1/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "810124ed101024f402c3e2586ee34ab739fc638158d51e4166fe02662a3a93f1"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.15.1/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "18bfa7904616a131f0b10be110829fff18d166dbc1eb03ea09a5e7ab7a4c7fc7"
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
