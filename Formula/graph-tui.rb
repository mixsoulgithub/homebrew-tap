class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.3.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "122d28d93a1209a3d45e724d0db9a37d04f660d435f6432a02c38d3c7887ee5c"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.3.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "1d6618aa1dc5058e7a403fe56685ee43a95be2a621d7371958f8f4ec9bad3bf1"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.3.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "15090fba36b4034149ed9b6b78194624bdfae20907d48517b7247d1d28bc3528"
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
