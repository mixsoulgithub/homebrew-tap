class MetroTui < Formula
  desc "Metro maps in the terminal: box-drawing characters, one true color per line"
  homepage "https://github.com/mixsoulgithub/metro-tui"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.4/metro-tui-aarch64-apple-darwin.tar.gz"
      sha256 "3ceb7ca2b386621f8c9c68c5b2f31385c5d23b403254a78bca52217d9608e8b5"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.4/metro-tui-x86_64-apple-darwin.tar.gz"
      sha256 "8793a9ce4e99bf4af01e6a0ffbd49e02889e221bbc724bc11537b07370a10594"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/metro-tui/releases/download/v0.1.4/metro-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "be58f4cfe38c947095ca980f29b099332e3b9a5600da9600d9c3c34a25368290"
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
