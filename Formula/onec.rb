class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://github.com/maurymarkowitz/OpenNEC/releases/tag/v1.1.3.tar.gz"
  sha256 "3bbb7d2eed63980c2c424d22092d987bf50ae52ef357664efd378fcbe7aff86e"
  license "MIT"

  def install
    system "make"
    bin.install "onec"
  end

  test do
    system "#{bin}/onec", "--version"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
