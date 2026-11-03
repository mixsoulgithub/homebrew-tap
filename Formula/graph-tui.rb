class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.5.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "1d96c9305b10424c3c837a14ab55f043bf62f13f6fe5229788f1e7cb07cd83b9"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.5.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "d49f30a20be8f000a9e34a7e6e43ad4084362e73c22e2f56520cc6dfb24b9c8a"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.5.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7f1bb5d9d7f059a7d6c95e758f5e8a8b7b4058d9d105ba2cfa99d3b71bf4a14f"
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
