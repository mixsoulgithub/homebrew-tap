class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.7.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "e650797a7e72a69949cb4e8e90aba7d5605f7b61274f0332101b76055ff05cdf"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.7.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "c4adc020710d9caaf47c47c08778eb15a6f9e63e57adcb3863f055d16ce49361"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.7.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a6c4188a73b78b381c2c5f6bbcc017d73446615cd3a82ee74785b8ca708a8d00"
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
