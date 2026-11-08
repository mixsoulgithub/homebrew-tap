class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.14.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "5d001e411c482aea3a63eced0b4078a344cf694b24959effa3f71a0b8fe5f9e3"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.14.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "f91b5c52112fa8afaecfd3e26c6be3f923064cd4144b79b762e4c0968951b604"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.14.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9c6051e667c432e945c6409350163ee80e1629a5e9aa642792c0256c10792671"
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
