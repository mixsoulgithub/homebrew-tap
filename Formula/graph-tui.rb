class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.17.2/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "c958c6b4be87fd719729bff8590ad755098a473f3668f4810aa7198015df51f4"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.17.2/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "d5ceb2c77bc6ec15e2ea97d44ed2a34c8e7238a968d1a1cf608cb6af88b0c37e"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.17.2/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d5f07ea165e19a08687e0117d75889a232cccb168e427a0f7cb8642f313a3f76"
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
