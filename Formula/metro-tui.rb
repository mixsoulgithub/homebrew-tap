class MetroTui < Formula
  desc "Metro maps in the terminal: box-drawing characters, one true color per line"
  homepage "https://github.com/mixsoulgithub/metro-tui"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.3/metro-tui-aarch64-apple-darwin.tar.gz"
      sha256 "5260ed942712e5fef5de624042a0054a5937d3a7c3045d44aa3a08195d630b15"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.3/metro-tui-x86_64-apple-darwin.tar.gz"
      sha256 "b955adc56f0714d4742d7b3bb26c30fa114e17acb21f7b7112cd5fb636d113b3"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.3/metro-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "52a55f902d99f7ca4dbfad415c6d2f90285a435f751fcf8adbb81ea5862ae859"
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
