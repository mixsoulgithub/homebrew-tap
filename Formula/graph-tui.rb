class GraphTui < Formula
  desc "Graph renderer and editor for the terminal: box-drawing edges, orthogonal routing"
  homepage "https://github.com/mixsoulgithub/graph-tui"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.2.0/graph-tui-aarch64-apple-darwin.tar.gz"
      sha256 "a2bd1b721f39bae8519cbb00c4d2c10c2f3549d8fe27f0610baed5b2847b9b80"
    end
    on_intel do
      url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.2.0/graph-tui-x86_64-apple-darwin.tar.gz"
      sha256 "6675f484acebddc40b46f9be6c81e68af698d0440b515600862603b786d84b58"
    end
  end

  on_linux do
    # 静态链接版,任何 x86_64 Linux 都能跑
    url "https://github.com/mixsoulgithub/graph-tui/releases/download/v0.2.0/graph-tui-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b83732757b906605e253a3bd8923be5f28be87fce75026bef338a0639887453f"
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
