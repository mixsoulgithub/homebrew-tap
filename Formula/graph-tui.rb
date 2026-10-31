class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "e63c9db261bd7ac174a09f89a0975ec3c4fa7ce616ef6fb8ebae9a32385efee5"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "979b938b981406ff0fc2178b99361f30f6288d4de8963608e57022a10268676f"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.1.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "dd3ea83315ee22449a727e88be34e6726bcbc70e9fbb272be4d2f0cd1ceb9322"
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
