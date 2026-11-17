class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.17.1/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "08f966f8426dc69de0d6a63ebbb114030b4f1c5580216fd025a3179a38941dac"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.17.1/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "822849acc988f1d580d4930182544a4d058d73ff1a4b3e5f7059a107acddd701"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.17.1/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2e23209edf54fbd4f7282529fba92291c397fc15c251527501718c3e3ef47da6"
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
