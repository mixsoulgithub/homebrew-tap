class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.1/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "fc75443db4b567ad0442d9b2c2d7d6df2996d09b68283b574ce1142050ac2cf8"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.1/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "879d6792ac1dc78023d82e0e41020c6f678833ac2af383660e133637f783948a"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.1/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7ba93fddf0890a2fcdba4f97982e01383dd68ea7e180a871d28e2438ff35462e"
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
