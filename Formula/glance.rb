class Glance < Formula
  desc "Live Apple silicon system monitor for the terminal"
  homepage "https://github.com/TianMingNanWei/glance-cli"
  url "https://github.com/TianMingNanWei/glance-cli/releases/download/v0.1.1/glance-0.1.1-macos-universal.tar.gz"
  sha256 "e7004f0fcc6b90430b15ab116b12b1674acab225139b023b4c16d080e161f1fa"
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
