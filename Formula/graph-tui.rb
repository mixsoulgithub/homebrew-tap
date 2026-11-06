class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.12.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "23d0cb042bf8172295a87c5debdd24a9e25888f9f180f896d36a7923bb2382e1"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.12.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "4c0df0496385402c3b0121b94d5877a09b225e83cc4423a1085372cb30db5d50"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.12.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c17a32c936a84edb663102f01970aced5b2442a95f380f4ed8a26ec51168739d"
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
