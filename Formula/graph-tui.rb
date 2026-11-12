class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.16.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "47acaf9c7abb76b8016b696e660a6a805ffa22353049d7dd26e7fdc60df64393"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.16.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "251fe1c1a1d97b8cfd927e6f8c73525d339cf6f2760ee88f0f3ca0d7136efd9e"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.16.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a6924dd31035eca1eaa1592b4d53bbae313f57d7ce2f7bc6eac2a4bdb51e3f8a"
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
