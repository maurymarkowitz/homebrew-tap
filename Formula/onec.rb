class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://api.github.com/repos/maurymarkowitz/OpenNEC/tarball/v1.2.0"
  sha256 "c55b286eeac94de5e535407acf69f0f7546e06046e9d994e870b7754713bc338"
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
