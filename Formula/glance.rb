class Glance < Formula
  desc "Live Apple silicon system monitor for the terminal"
  homepage "https://github.com/TianMingNanWei/glance-cli"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/TianMingNanWei/glance-cli/releases/download/v0.1.0/glance-0.1.0-macos-arm64.tar.gz"
    sha256 "47daa856326fc27b789f1f56787efbfd80a9179f6c3e3729a3f128e2ef88c0e9"
  end
  on_intel do
    url "https://github.com/TianMingNanWei/glance-cli/releases/download/v0.1.0/glance-0.1.0-macos-x86_64.tar.gz"
    sha256 "f8341b985383760679e16a76cd5ee5e267122c579d4dd00a406cdb8f0b33df51"
  end

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
