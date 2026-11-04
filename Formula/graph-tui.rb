class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.9.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "8e67231b2d2b31df8b41dc7467573c2543ceb01a11374c270a64c446e6e8d17e"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.9.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "34882e525619ae959fdaad7ce8bcfa526a6e980d16294ac4129bb7e80b2abb44"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.9.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "567248f94ce48fc65ee5a07098705d01cd408d0ddabe329151c15d2311e7f3dc"
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
