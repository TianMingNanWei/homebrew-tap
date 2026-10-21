class Glance < Formula
  desc "Live Apple silicon system monitor for the terminal"
  homepage "https://github.com/TianMingNanWei/glance-cli"
  url "https://github.com/TianMingNanWei/glance-cli/releases/download/v0.1.0/glance-0.1.0-macos-universal.tar.gz"
  sha256 "50c6b49e84439004076136a8ac74bb2c32f44ef540e34fd28d7a4341af5a0832"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  def install
    bin.install "glance"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glance --version")
    assert_match "\"chip\"", shell_output("#{bin}/glance snapshot --json")
  end
end
