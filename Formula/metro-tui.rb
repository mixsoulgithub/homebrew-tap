class MetroTui < Formula
  desc "Metro maps in the terminal: box-drawing characters, one true color per line"
  homepage "https://github.com/mixsoulgithub/metro-tui"
  version "0.1.0"
  license "MIT"

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.0/metro-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "77d7640ac47f2a6bdc3cd18025a56275631428a0f45b385095d47e45733d8018"
  end

  def install
    bin.install "metro"
    prefix.install "LICENSE"
    doc.install "README.md", "README_EN.md"
  end

  test do
    assert_match "metro", shell_output("#{bin}/metro --help")
  end
end
