class MetroTui < Formula
  desc "Metro maps in the terminal: box-drawing characters, one true color per line"
  homepage "https://github.com/mixsoulgithub/metro-tui"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.2/metro-tui-aarch64-apple-darwin.tar.gz"
      sha256 "e6c65ede9c715097ec78bf2e5c67a29543fb3705bfbdad41cc112b9f40647f31"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.2/metro-tui-x86_64-apple-darwin.tar.gz"
      sha256 "ec7c6fa02018f2b3de03bc61aacb0dd2411d74a2bfdf6797ec355afdf0310e04"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.2/metro-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9ae79b4afc269e6e447719141abd0dc189299067953a8f6f2c59f8bcbcbc3c19"
  end

  def install
    bin.install "metro-tui"
    prefix.install "LICENSE"
    doc.install "README.md", "README_EN.md"
  end

  test do
    assert_match "metro-tui", shell_output("#{bin}/metro-tui --help")
  end
end
