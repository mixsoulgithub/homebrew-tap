class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.10.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "a8f9765938e0c6766e205d300a05b192f85b07b413050b552edf747beeb8fa16"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.10.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "9198753bf6eb5876da1dcd8a4c66dc7f0216dd613d89c349ea1e5b63097673d1"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.10.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2bcddaba2573faa2ec77bcbb2f3424cb0a7ca113b1e7034b8a180490596f26f0"
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
